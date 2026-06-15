% read_edf_2011.m
% this script is a misnomer as I don't have the SF 2011 edf files -- rather
% we are doing the processing steps on the "raw" mat file which appears to
% already be clipped at the bottom. 
% 
% plot profiles and clip top/bottom junk
% bin data
% plot binned profiles
% save tidied mat & netcdf files

clear

load('raw mat/XCTD_AUG2011_raw.mat');

nx = length(latxctd); % number of xctd casts
cnum = 1:nx; % this is redundant here but carried over from Mar 2010 for generalizability
plabel = num2str(cnum');

%% metadata

lon = lonxctd;
lat = latxctd;

time = nan(1,nx);

time(cnum(1)) = datenum(2011,08,26,19,10,0); % time in UTC
time(cnum(2)) = datenum(2011,08,26,19,18,0);
time(cnum(3)) = datenum(2011,08,26,19,26,0);
time(cnum(4)) = datenum(2011,08,26,19,33,0);

%% map

% quick map plot to double-check location metadata looks okay
dx = 0.01;

figure(nx+1), clf
geoscatter(lat, lon)
hold on
text(lat, lon+dx, plabel)

%% indices for trimming

% Trim (at least) upper 4 m from all temp & cond profiles
itop = [31;
    31;
    31;
    31];

% Optionally trim more from top of cond profiles
itop_sal = itop;

% Clip at bottom of each cast
ibot(1:3) = 6000;
ibot(4) = 4830;

%% trim and bin profiles

% matrices for raw data
TX(1:8000,1:nx)=NaN;
CX(1:8000,1:nx)=NaN;
SX(1:8000,1:nx)=NaN; 
ZX(1:8000,1:nx)=NaN;
PX(1:8000,1:nx)=NaN;

% matrices for binned data
depth = [1:2:899];
nbins = length(depth);

pres = gsw_p_from_z(-depth,nanmean(lat));

temp = nan(nbins,nx);
sal = nan(nbins,nx);

for ii=1:nx
    
    
    % trim raw data
    ZX(itop(ii):ibot(ii), ii) = Zxctd(itop(ii):ibot(ii), ii);
    TX(itop(ii):ibot(ii), ii) = Txctd(itop(ii):ibot(ii), ii);
    SX(itop_sal(ii):ibot(ii), ii) = Sxctd(itop_sal(ii):ibot(ii), ii);
    
    % bin-average trimmed data
    for jj=1:nbins
        k = find(ZX(:,ii)>depth(jj)-1 & ZX(:,ii)<=depth(jj)+1);
        if k
            temp(jj,cnum(ii)) = nanmean(TX(k,ii));
            sal(jj,cnum(ii)) = nanmean(SX(k,ii));      
        end
    end
    
    % plot raw, trimmed, and binned data to check it looks okay
    % also check date/time in title of each figure looks right
    figure(ii),clf
    set(gcf,'position',[-1348 372 1000 425]);
    
    % temp profile
    subplot(1,4,1)
    plot(Txctd(:,ii),Zxctd(:,ii))
    hold on
    plot(TX(:,ii), ZX(:,ii))
    plot(temp(:,cnum(ii)), depth,'k')
    grid on
    xlabel('temp [^oC]')
    ylabel('depth [m]')
    axis ij 
    axis([nanmin(temp(:,cnum(ii)))-0.2 nanmax(temp(:,cnum(ii)))+0.2 ...
        0 ceil(nanmax(ZX(:,ii)/100))*100])
    legend('raw','trimmed','binned')
    set(gca,'fontsize',12)
    title(datestr(time(cnum(ii))))
    
    
    % sal profile
    subplot(1,4,2)
    plot(Sxctd(:,ii),Zxctd(:,ii))
    hold on
    plot(SX(:,ii), ZX(:,ii))
    plot(sal(:,cnum(ii)), depth,'k')
    grid on
    xlabel('sal [psu]')
    ylabel('depth [m]')
    axis ij 
    axis([nanmin(sal(:,cnum(ii)))-0.1 nanmax(sal(:,cnum(ii)))+0.1 ...
        0 ceil(nanmax(ZX(:,ii)/100))*100])
    set(gca,'fontsize',12)
    
    % T-S
    subplot(1,4,3:4)
    plot(Sxctd(:,ii),Txctd(:,ii))
    hold on
    plot(SX(:,ii), TX(:,ii))
    plot(sal(:,cnum(ii)), temp(:,cnum(ii)),'k')
    grid on
    xlabel('sal [psu]')
    ylabel('temp [^oC]')
    set(gca,'fontsize',12)
    axis([nanmin(sal(:,cnum(ii)))-0.1 nanmax(sal(:,cnum(ii)))+0.1 ... 
        nanmin(temp(:,cnum(ii)))-0.2 nanmax(temp(:,cnum(ii)))+0.2])
    axis square
    
end


% reshape variables to our standard netcdf format

temp = temp'; % Nx450
sal = sal'; % Nx450

%% save .mat

%Create matfile with variables
save('Sermilik2011_XCTD.mat','depth','time','lat','lon','temp','sal','pres')

%% create netCDF


outfile = 'Sermilik2011_XCTD.nc' 
delete(outfile)
instrument = 'Sippican XCTD-1 probes';
summary = 'Temperature and salinity profiles from 4 eXpendable Conductivity Temperature Depth (XCTD)-1 probes collected in Sermilik Fjord, East Greenland, on August 26 2011.';
title = 'XCTD profiles of temperature and salinity from Sermilik Fjord during August 2011';

% create blank nc file 

    mode = netcdf.getConstant('NETCDF4'); 
    mode = bitor(mode,netcdf.getConstant('CLASSIC_MODEL'));
    ncid = netcdf.create(outfile,mode);
    netcdf.close(ncid);

% global attributes 

    ncid = netcdf.open(outfile,'NC_WRITE');
    netcdf.reDef(ncid);
    varid = netcdf.getConstant('NC_GLOBAL');

    netcdf.putAtt(ncid,varid,'time_coverage_start', [datestr(time(1),29)   'T' datestr(time(1),13)   'Z']);
    netcdf.putAtt(ncid,varid,'time_coverage_end',   [datestr(time(end),29) 'T' datestr(time(end),13) 'Z']);

    netcdf.putAtt(ncid,varid,'geospatial_lat_min',   nanmin(lat));
    netcdf.putAtt(ncid,varid,'geospatial_lat_max',   nanmax(lat));
    netcdf.putAtt(ncid,varid,'geospatial_lat_units', 'degrees_north')     ;

    netcdf.putAtt(ncid,varid,'geospatial_lon_min',   tsnanmin(lon));
    netcdf.putAtt(ncid,varid,'geospatial_lon_max',   tsnanmax(lon));
    netcdf.putAtt(ncid,varid,'geospatial_lon_units', 'degrees_east')      ;

    netcdf.putAtt(ncid,varid,'geospatial_vertical_min',        1)  ;
    netcdf.putAtt(ncid,varid,'geospatial_vertical_max',        899)  ;
    netcdf.putAtt(ncid,varid,'geospatial_vertical_positive',   'down')  ;
    netcdf.putAtt(ncid,varid,'geospatial_vertical_units',      'm')  ;
    netcdf.putAtt(ncid,varid,'geospatial_vertical_resolution', 2);

    netcdf.putAtt(ncid,varid,'contributor_name','Fiamma Straneo, Jamie Holte, Margaret Lindeman, Aurora Roth, Fiamma Straneo');
    netcdf.putAtt(ncid,varid,'contributor_role','Principal Investigator, Data Processor, Data Processor, Data Processor, Data Collector');

    netcdf.putAtt(ncid,varid,'creator_name','Dr. Fiamma Straneo, Professor');
    netcdf.putAtt(ncid,varid,'creator_email','fstraneo@seas.harvard.edu');
    netcdf.putAtt(ncid,varid,'creator_institution','Harvard University');

    netcdf.putAtt(ncid,varid,'instrument',       instrument)
    netcdf.putAtt(ncid,varid,'processing_level', 'Quality Controlled');
    netcdf.putAtt(ncid,varid,'summary',          summary)
    netcdf.putAtt(ncid,varid,'title',            title)

% dimensions 

    zdim       = netcdf.defDim(ncid,'z',length(depth));
    profiledim = netcdf.defDim(ncid,'profile',length(time));
    
% profile attributes 

    profile_ID = netcdf.defVar(ncid,'profile','double',profiledim);    
    netcdf.putAtt(ncid,profile_ID,  'standard_name','profile_number'); % Do not change

% time attributes 

    time_ID = netcdf.defVar(ncid,'time','double',profiledim);
    
    netcdf.putAtt(ncid,time_ID,'standard_name','time'); % Do not change
    netcdf.putAtt(ncid,time_ID,'long_name','Time');
    netcdf.putAtt(ncid,time_ID,'units','days since 1970-01-01 00:00:00');
    netcdf.putAtt(ncid,time_ID,'calendar','gregorian');
    netcdf.putAtt(ncid,time_ID,'coordinates','profile');

% latitude attributes 
    latitude_ID = netcdf.defVar(ncid,'lat','double',profiledim);
    netcdf.putAtt(ncid,latitude_ID,'long_name','latitude in decimal degrees north');
    netcdf.putAtt(ncid,latitude_ID,'standard_name','latitude');
    netcdf.putAtt(ncid,latitude_ID,'units','degrees_north');
    netcdf.putAtt(ncid,latitude_ID,'coordinates','profile');

% longitude attributes 
    longitude_ID = netcdf.defVar(ncid,'lon','double',profiledim);
    netcdf.putAtt(ncid,longitude_ID,'long_name','longitude in decimal degrees east');
    netcdf.putAtt(ncid,longitude_ID,'standard_name','longitude');
    netcdf.putAtt(ncid,longitude_ID,'units','degrees_east');
    netcdf.putAtt(ncid,longitude_ID,'coordinates','profile');

% depth attributes 
    depth_ID = netcdf.defVar(ncid,'depth','double',zdim);    
    netcdf.putAtt(ncid,depth_ID,'long_name','depth');
    netcdf.putAtt(ncid,depth_ID,'units','m');
    netcdf.putAtt(ncid,depth_ID,'positive','down');  
    netcdf.putAtt(ncid,depth_ID,'coordinates','z');

    % pressure attributes 
    pres_ID = netcdf.defVar(ncid,'pres','double',zdim);
    netcdf.putAtt(ncid,pres_ID,'long_name','sea water pressure');
    netcdf.putAtt(ncid,pres_ID,'units','dbar');
    netcdf.putAtt(ncid,pres_ID,'positive','down');  
    netcdf.putAtt(ncid,pres_ID,'coordinates','z');

    % sal attributes 
    sal_ID = netcdf.defVar(ncid,'sal','double',[profiledim zdim])
    netcdf.putAtt(ncid,sal_ID,'long_name','sea water practical salinity');
    netcdf.putAtt(ncid,sal_ID,'units','PSU');
    netcdf.putAtt(ncid,sal_ID,'data_min',tsnanmin(tsnanmin(sal)));
    netcdf.putAtt(ncid,sal_ID,'data_max',tsnanmax(tsnanmax(sal)));   
    netcdf.putAtt(ncid,sal_ID,'_FillValue',NaN);
    netcdf.putAtt(ncid,sal_ID,'coordinates','profile z');

    % temp Attributes
    temp_ID = netcdf.defVar(ncid,'temp','double',[profiledim zdim])
    netcdf.putAtt(ncid,temp_ID,'long_name','sea water temperature');
    netcdf.putAtt(ncid,temp_ID,'units','degree_Celsius');
    netcdf.putAtt(ncid,temp_ID,'data_min',tsnanmin(tsnanmin(temp)));
    netcdf.putAtt(ncid,temp_ID,'data_max',tsnanmax(tsnanmax(temp)));   
    netcdf.putAtt(ncid,temp_ID,'_FillValue',NaN);
    netcdf.putAtt(ncid,temp_ID,'coordinates','profile z');
               
    
netcdf.endDef(ncid);

% write variables 

profiledate = time-datenum(1970,1,1,0,0,0);

    netcdf.putVar(ncid, time_ID,      profiledate);
    netcdf.putVar(ncid, depth_ID,     depth);
    netcdf.putVar(ncid, pres_ID,      pres);
    netcdf.putVar(ncid, profile_ID,   1:nx); %Need to change
    netcdf.putVar(ncid, latitude_ID,  lat);
    netcdf.putVar(ncid, longitude_ID, lon);    
    netcdf.putVar(ncid, sal_ID,       sal);
    netcdf.putVar(ncid, temp_ID,      temp);
    
netcdf.close(ncid);
ncdisp(outfile) 






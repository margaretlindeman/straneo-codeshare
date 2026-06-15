% read_xctdedf.m
% Read XCTD EDF files into matfile and netcdf. This file minimally
% processes the XCTD data by
% - Chopping off bottom and top junk data
% - Checking for salinity spiking issues
% - Binned to 2 m depth bins 
% 
latxctd = nan(1,5);
lonxctd = nan(1,5);
% 
latxctd(1:5)=66 + [0.3145 0.3091 0.2816 0.2705 0.2445]; 
lonxctd(1:5)=-1*(37 + [0.7700 0.7121 0.6271 0.5524 0.6471]);

nsta = 1:5; 
Txctd(1:7500,nsta)=NaN;
Sxctd(1:7500,nsta)=NaN;
Cxctd(1:7500,nsta)=NaN;
Zxctd(1:7500,nsta)=NaN;


[dum,sdum,xdep,xtemp,xcond,xsal,dum,dum,dum]=textread('C3_00042_noheader.edf','%f%8s%f%f%f%f%f%f%f','delimiter','');
ll=1;
iend(ll) = 4927;
igood = 1:iend(ll);
ngood = length(igood);
Txctd(igood,ll)=xtemp(igood);
Zxctd(igood,ll)=xdep(igood);
Cxctd(igood,ll) = xcond(igood);
Sxctd(igood,ll)=xsal(igood);
nx(ll)=ngood;
Zbotxctd(ll)=Zxctd(igood(end)-1,ll);

[dum,sdum,xdep,xtemp,xcond,xsal,dum,dum,dum]=textread('C3_00043_noheader.edf','%f%8s%f%f%f%f%f%f%f','delimiter','');
ll=2;
iend(ll) = 4850;
igood = 1:iend(ll);
ngood = length(igood);
Txctd(igood,ll)=xtemp(igood);
Zxctd(igood,ll)=xdep(igood);
Cxctd(igood,ll) = xcond(igood);
Sxctd(igood,ll)=xsal(igood);
nx(ll)=ngood;
Zbotxctd(ll)=Zxctd(igood(end)-1,ll);

[dum,sdum,xdep,xtemp,xcond,xsal,dum,dum,dum]=textread('C3_00044_noheader.edf','%f%8s%f%f%f%f%f%f%f','delimiter','');
ll=3;
iend(ll) = 3825;
igood = 1:iend(ll);
ngood = length(igood);
Txctd(igood,ll)=xtemp(igood);
Zxctd(igood,ll)=xdep(igood);
Cxctd(igood,ll) = xcond(igood);
Sxctd(igood,ll)=xsal(igood);
nx(ll)=ngood;
Zbotxctd(ll)=Zxctd(igood(end)-1,ll);

[dum,sdum,xdep,xtemp,xcond,xsal,dum,dum,dum]=textread('C3_00045_noheader.edf','%f%8s%f%f%f%f%f%f%f','delimiter','');
ll=4;
iend(ll) = 3402;
igood = 1:iend(ll);
ngood = length(igood);
Txctd(igood,ll)=xtemp(igood);
Zxctd(igood,ll)=xdep(igood);
Cxctd(igood,ll) = xcond(igood);
Sxctd(igood,ll)=xsal(igood);
nx(ll)=ngood;
Zbotxctd(ll)=Zxctd(igood(end)-1,ll);

[dum,sdum,xdep,xtemp,xcond,xsal,dum,dum,dum]=textread('C3_00046_noheader.edf','%f%8s%f%f%f%f%f%f%f','delimiter','');
ll=5;
iend(ll) = 4104;
igood = 1:iend(ll);
ngood = length(igood);
Txctd(igood,ll)=xtemp(igood);
Zxctd(igood,ll)=xdep(igood);
Cxctd(igood,ll) = xcond(igood);
Sxctd(igood,ll)=xsal(igood);
nx(ll)=ngood;
Zbotxctd(ll)=Zxctd(igood(end)-1,ll);


Pxctd = gsw_pres(Zxctd,[66 66 66 66 66]);

% % how good is the salinity calculated by Sippican?
% % ANSWER - it is pretty much the same so use Sippicans'
% cdrt = Cxctd/sw_c3515;
% Sxctd2 = sw_salt(cdrt,Txctd,Pxctd);
% PDxctd = sw_pden(Sxctd,Txctd,Pxctd,0)-1000;

PTxctd = gsw_ptmp(Sxctd,Txctd,Pxctd,0);

clear Cxctd dum iend igood ll ngood nsta nx PTxctd sdum xcond xdep xsal xtemp 

%Where are these profiles
figure; geoscatter(latxctd, lonxctd)
%Check out profiles and figure out clipping data
%Plot Temp
figure; plot(Txctd,-1.*Zxctd);
%Plot Sal
figure; plot(Sxctd,-1.*Zxctd);

%Creates TS plot
figure; plot(Sxctd, Txctd)

%Determined from plots that the top 4 m of the data are before the probe
%has turned on and equilibrated. For all profiles we cut the top 4 m and
%replace with nans from indices 1 - 27. 

infill = nan(5,27)';
Txctd(1:27,:) = infill;

Sxctd(1:27,:) = infill;

%Loop through salinity profiles to check for obvious large salinity spikes.
%Replace with NaN at that data point

[k,i] = size(Txctd);

for ii = 1:i
    for kk = 1:k
        if Sxctd(kk,ii) < 1
            Sxctd(kk,ii) = NaN;
        end
        if Txctd(kk,ii) < - 4
            Txctd(kk,ii) = NaN;
        end
    end
end



%Rename to match code from Jamie so that we can appropriately bin profiles
%to 2 m depth bins
TX = Txctd;
SX = Sxctd;
ZX = Zxctd;
PX = Pxctd;

% now save in 1 m bins
depthbins = [1:2:899];

clear temp sal i
for j = 1:5
    for i = 1:length(depthbins)
        temp(j,i) = NaN;
        sal(j,i) = NaN;
        clear k
        k = find(ZX(:,j)>depthbins(i)-1 & ZX(:,j)<=depthbins(i)+1);
        if k
            temp(j,i) = tsnanmean(TX(k,j));
            sal(j,i) = tsnanmean(SX(k,j));      
        end
    end
end

pres = gsw_pres(depthbins',66);


%Plot binned profiles
figure; plot(temp,-1.*depthbins);
figure; plot(sal,-1.*depthbins);
figure; plot(sal',temp');


%Add date/time information from metadata and logsheets. Date format are in
%matlab datenum format

date = nan(1,5);

date(1) = datenum(2015,7,27,15,50,0);
date(2) = datenum(2015,7,27,15,55,0);
date(3) = datenum(2015,7,27,16,05,0);
date(4) = datenum(2015,7,27,16,10,0);
date(5) = datenum(2015,7,27,16,20,0);


lat = latxctd;
lon = lonxctd;
Txctd = temp;
Sxctd = sal;
Pxctd = pres;
depth = depthbins;

XCTDtime = date;
XCTDlat = lat;
XCTDlon = lon;

clear infill Zxctd latxctd lonxctd Zbotxctd

%Create matfile with variables
save('Sermilik2015_XCTD.mat','depth','date','lat','lon','temp','sal','pres')

%CREATE NETCDF FILE FOR ARCHIVING - MUST EDIT FOR EACH YEAR

outfile = 'Sermilik2015_XCTD.nc' 
delete(outfile)
instrument = 'Sippican XCTD-1 probes';
summary = 'Temperature and salinity profiles from 5 eXpendable Conductivity Temperature Depth (XCTD) 1 probes collected in Sermilik Fjord, East Greenland, on July 27 2015.';
title = 'XCTD profiles of temperature and salinity from Sermilik Fjord during July 2015';

% create blank nc file 

    mode = netcdf.getConstant('NETCDF4'); 
    mode = bitor(mode,netcdf.getConstant('CLASSIC_MODEL'));
    ncid = netcdf.create(outfile,mode);
    netcdf.close(ncid);

% global attributes 

    ncid = netcdf.open(outfile,'NC_WRITE');
    netcdf.reDef(ncid);
    varid = netcdf.getConstant('NC_GLOBAL');

    netcdf.putAtt(ncid,varid,'time_coverage_start', [datestr(XCTDtime(1),29)   'T' datestr(XCTDtime(1),13)   'Z']);
    netcdf.putAtt(ncid,varid,'time_coverage_end',   [datestr(XCTDtime(end),29) 'T' datestr(XCTDtime(end),13) 'Z']);

    netcdf.putAtt(ncid,varid,'geospatial_lat_min',   tsnanmin(XCTDlat));
    netcdf.putAtt(ncid,varid,'geospatial_lat_max',   tsnanmax(XCTDlat));
    netcdf.putAtt(ncid,varid,'geospatial_lat_units', 'degrees_north')     ;

    netcdf.putAtt(ncid,varid,'geospatial_lon_min',   tsnanmin(XCTDlon));
    netcdf.putAtt(ncid,varid,'geospatial_lon_max',   tsnanmax(XCTDlon));
    netcdf.putAtt(ncid,varid,'geospatial_lon_units', 'degrees_east')      ;

    netcdf.putAtt(ncid,varid,'geospatial_vertical_min',        1)  ;
    netcdf.putAtt(ncid,varid,'geospatial_vertical_max',        899)  ;
    netcdf.putAtt(ncid,varid,'geospatial_vertical_positive',   'down')  ;
    netcdf.putAtt(ncid,varid,'geospatial_vertical_units',      'm')  ;
    netcdf.putAtt(ncid,varid,'geospatial_vertical_resolution', 2);

    netcdf.putAtt(ncid,varid,'contributor_name','Fiamma Straneo, Jamie Holte, Margaret Lindeman, Aurora Roth, Gordon Hamilton, Dan Sulak, Ari Daniel');
    netcdf.putAtt(ncid,varid,'contributor_role','Principal Investigator, Data Processor, Data Processor, Data Processor, Data Collector, Data Collector, Data Collector');

    netcdf.putAtt(ncid,varid,'creator_name','Dr. Fiamma Straneo, Professor');
    netcdf.putAtt(ncid,varid,'creator_email','fstraneo@seas.harvard.edu');
    netcdf.putAtt(ncid,varid,'creator_institution','Harvard Univeristy');

    netcdf.putAtt(ncid,varid,'instrument',       instrument)
    netcdf.putAtt(ncid,varid,'processing_level', 'Quality Controlled');
    netcdf.putAtt(ncid,varid,'summary',          summary)
    netcdf.putAtt(ncid,varid,'title',            title)

% dimensions 

    zdim       = netcdf.defDim(ncid,'z',length(depthbins));
    profiledim = netcdf.defDim(ncid,'profile',length(XCTDtime));
    
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

profiledate = XCTDtime-datenum(1970,1,1,0,0,0);

    netcdf.putVar(ncid, time_ID,      profiledate);
    netcdf.putVar(ncid, depth_ID,     depthbins);
    netcdf.putVar(ncid, pres_ID,      pres);
    netcdf.putVar(ncid, profile_ID,   1:5); %Need to change
    netcdf.putVar(ncid, latitude_ID,  XCTDlat);
    netcdf.putVar(ncid, longitude_ID, XCTDlon);    
    netcdf.putVar(ncid, sal_ID,       sal);
    netcdf.putVar(ncid, temp_ID,      temp);
    
netcdf.close(ncid);
ncdisp(outfile) 








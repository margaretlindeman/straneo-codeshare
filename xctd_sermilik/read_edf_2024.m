clear

% READ EDF files
nx = 8; % number of xctd stations

% reading XCTD edf files one by one, header removed
TX(1:8000,1:nx)=NaN;
CX(1:8000,1:nx)=NaN;
SX(1:8000,1:nx)=NaN; 
ZX(1:8000,1:nx)=NaN;
PX(1:8000,1:nx)=NaN;

i=1;
[dum, dum, xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD-01 TSK 20240707114753noheader.edf','%f%s%f%f%f%f%f%f%f');

igood=1:4072;
in = igood;
TX(in,i)=xtemp(igood);
CX(in,i)=xcond(igood);
SX(in,i)=xsal(igood);  
ZX(in,i)=xdepth(igood);


i=2;
[dum, dum, xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD-01 TSK 20240707115312noheader.edf','%f%s%f%f%f%f%f%f%f');

igood = 1:2577;
in = igood;
TX(in,i)=xtemp(igood);
CX(in,i)=xcond(igood);
SX(in,i)=xsal(igood);  
ZX(in,i)=xdepth(igood);

 [dum, dum, xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD-01 TSK 20240707115904noheader.edf','%f%s%f%f%f%f%f%f%f');
i=3;
igood = 1:4718;
in = igood;
TX(in,i)=xtemp(igood);
CX(in,i)=xcond(igood);
SX(in,i)=xsal(igood);  
ZX(in,i)=xdepth(igood);

[dum, dum, xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD-01 TSK 20240707120810noheader.edf','%f%s%f%f%f%f%f%f%f');
i=4;
igood = 1:4861;
in = igood;
TX(in,i)=xtemp(igood);
CX(in,i)=xcond(igood);
SX(in,i)=xsal(igood);  
ZX(in,i)=xdepth(igood);


[dum, dum, xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD-01 TSK 20240707121521noheader.edf','%f%s%f%f%f%f%f%f%f');
i=5;
igood = 1:4906;
in = igood;
TX(in,i)=xtemp(igood);
CX(in,i)=xcond(igood);
SX(in,i)=xsal(igood);  
ZX(in,i)=xdepth(igood);

[dum, dum, xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD-01 TSK 20240707123545noheader.edf','%f%s%f%f%f%f%f%f%f');
i=6;
igood = 1:3770;
in = igood;
TX(in,i)=xtemp(igood);
CX(in,i)=xcond(igood);
SX(in,i)=xsal(igood);  
ZX(in,i)=xdepth(igood);

[dum, dum, xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD-01 TSK 20240707124504noheader.edf','%f%s%f%f%f%f%f%f%f');
i=7;
igood = 1:3046;
in = igood;
TX(in,i)=xtemp(igood);
CX(in,i)=xcond(igood);
SX(in,i)=xsal(igood);  
ZX(in,i)=xdepth(igood);

[dum, dum, xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD-01 TSK 20240707125350noheader.edf','%f%s%f%f%f%f%f%f%f');
i=8;
igood = 1:4318;
in = igood;
TX(in,i)=xtemp(igood);
CX(in,i)=xcond(igood);
SX(in,i)=xsal(igood);  
ZX(in,i)=xdepth(igood);

% 
XCTDlon(1) = -37.99514;
XCTDlat(1) = 66.33819;
XCTDtime(1) = datenum(2024,07,7,11,00,0);

XCTDlon(2) = -37.95979;
XCTDlat(2) = 66.33756;
XCTDtime(2) = datenum(2024,07,7,11,07,0);

XCTDlon(3) = -37.91439;
XCTDlat(3) = 66.33686;
XCTDtime(3) = datenum(2024,07,7,11,13,0);

XCTDlon(4) = -37.88447;
XCTDlat(4) = 66.33333;
XCTDtime(4) = datenum(2024,07,7,11,23,0);

XCTDlon(5) = -37.80879;
XCTDlat(5) = 66.32951;
XCTDtime(5) = datenum(2024,07,7,11,29,0);

XCTDlon(6) = -37.03888;
XCTDlat(6) = 66.33589;
XCTDtime(6) = datenum(2024,07,7,11,49,0);

XCTDlon(7) = -37.39891;
XCTDlat(7) = 66.27490;
XCTDtime(7) = datenum(2024,07,7,11,59,0);

XCTDlon(8) = -37.65133;
XCTDlat(8) = 66.176403;
XCTDtime(8) = datenum(2024,07,7,12,08,0);


%for shift = -5:1:5
%    s(:,shift+6) = gsw_SP_from_C(CX(6+shift:7995+shift,6),TX(6:end-5,6),PX(6:end-5,6));
%end

%for i = 1:11
%   sd(i) =  (tsnanstd(s(:,i)-smooth(s(:,i),5)));
%end

%figure
%plot(sd)



load /Users/jwholte/Dropbox/Work/greenland/SF2023/serm_mask.mat

load /Users/jwholte/Dropbox/Work/greenland/NNA/bedmachine_sermgridded.mat
k = find(isnan(bathyg)==1);
bathyg(k) = 0;

minlat = 65.35;
maxlat = 66.5;
minlon = -36.6;
maxlon = -39;
dim =[minlat maxlat; maxlon minlon];

    fig1 = figure('Position', [10 10 1610 910]);
    hold on
   
    %m_proj('Azimuthal Equal-area','lon',-38,'lat',65.6,'rad',1,'rec','on');
    %m_proj('Azimuthal Equal-area','lon',-38,'lat',65.8,'rad',.95,'rec','on');
    %m_proj('Azimuthal Equal-area','lon',-37,'lat',65.3,'rad',3.8,'rec','on');

    m_proj('mercator','long',[dim(2,1) dim(2,2)],'lat',[dim(1,1) dim(1,2)]);


    m_contourf(lonr,latr,mask2,[1 1],'edgecolor','[0.6 0.6 0.6]','facecolor','[0.6 0.6 0.6]');
    m_contourf(lonr,latr,mask2,[2 2],'edgecolor','w','facecolor','w');
    m_contourf(lonr,latr,mask2,[3 3],'edgecolor','w','facecolor','w');
    m_contourf(lonr,latr,mask2,[4 4],'edgecolor','[0.6 0.6 0.6]','facecolor','[0.6 0.6 0.6]');

    ms = 6
    m_plot(XCTDlon,XCTDlat,'o','Markersize',ms,'MarkerFaceColor','k','MarkerEdgeColor','k')
    
    m_plot(XCTDlon(6),XCTDlat(6),'o','Markersize',ms,'MarkerFaceColor','m','MarkerEdgeColor','m')


cmin = -1000;
    cmax = 0;
    caxis([cmin cmax])
    c = colorbar;
    cmap = colormap;
    m_contourf(long,latg,bathyg,50,'linecolor','none');
    %m_contour(long,latg,bathyg,[-7950 -1000],'linecolor','k','linewidth',2);
   
    %m_gshhs_h('patch',[.75 .75 .75])
    m_grid('box','fancy','tickdir','in');
    hold off

figure
plot(TX,-ZX)



% now save in 1 m bins
depthbins = [0:1:900];

clear temp sal
for j = 1:8
    for i = 1:length(depthbins)
        temp(j,i) = NaN;
        sal(j,i) = NaN;
        clear k
        k = find(ZX(:,j)>depthbins(i)-.5 & ZX(:,j)<=depthbins(i)+.5);
        if k
            temp(j,i) = tsnanmean(TX(k,j));
            sal(j,i) = tsnanmean(SX(k,j));      
        end
    end
end

pres = sw_pres(depthbins',66);

outfile = 'Sermilik2024_XCTD.nc' 
delete(outfile)
instrument = 'Sippican XCTD-1N probes';
summary = 'Temperature and salinity profiles from 8 eXpendable Conductivity Temperature Depth (XCTD) 1N probes collected in Sermilik Fjord, East Greenland, from July 2024.';
title = 'Profiles of temperature and salinity from Sermilik Fjord during July 2024';

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

    netcdf.putAtt(ncid,varid,'geospatial_vertical_min',        0)  ;
    netcdf.putAtt(ncid,varid,'geospatial_vertical_max',        900)  ;
    netcdf.putAtt(ncid,varid,'geospatial_vertical_positive',   'down')  ;
    netcdf.putAtt(ncid,varid,'geospatial_vertical_units',      'm')  ;
    netcdf.putAtt(ncid,varid,'geospatial_vertical_resolution', 1);

    %netcdf.putAtt(ncid,varid,'contributor_name','Fiamma Straneo, MargaretJamie Holte, ');
    %netcdf.putAtt(ncid,varid,'contributor_role','Principal Investigator, Principal Investigator, Data Processor, Data Processor');

    %netcdf.putAtt(ncid,varid,'creator_url','https://straneolab.ucsd.edu/');
    %netcdf.putAtt(ncid,varid,'creator_name','Dr. Fiamma Straneo, Professor');
    %netcdf.putAtt(ncid,varid,'creator_email','fstraneo@ucsd.edu');
    %netcdf.putAtt(ncid,varid,'creator_institution','Scripps Institution of Oceanography');

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
    netcdf.putVar(ncid, profile_ID,   1:8);
    netcdf.putVar(ncid, latitude_ID,  XCTDlat);
    netcdf.putVar(ncid, longitude_ID, XCTDlon);    
    netcdf.putVar(ncid, sal_ID,       sal);
    netcdf.putVar(ncid, temp_ID,      temp);
    
netcdf.close(ncid);
ncdisp(outfile) 














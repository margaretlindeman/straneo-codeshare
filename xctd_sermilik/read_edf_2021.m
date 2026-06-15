clear


% READ EDF files
nx = 6; % number of xctd stations
Txctd(1:900,1:nx) = NaN;
Sxctd(1:900,1:nx) = NaN;
Cxctd(1:900,1:nx) = NaN;
PTxctd(1:900,1:nx) = NaN;
Pxctd(1:900,1:nx) = NaN;
Zxctd(1:900,1:nx) = NaN;

% reading XCTD edf files one by one, header removed
TX(1:8000,1:nx)=NaN;
CX(1:8000,1:nx)=NaN;
SX(1:8000,1:nx)=NaN; %my derived salinity
ZX(1:8000,1:nx)=NaN;
SX2(1:8000,1:nx)=NaN; %Sippican derived salinity
PX(1:8000,1:nx)=NaN;


%[xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD1.EDF','%f%f%f%f%f%f%f','delimiter',',');
% XCTD1_2021 - Apusek Glacier/Fjord 
i=1;
[dum, dum, xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD-01 TSK 20210810184736_noheader.edf','%f%s%f%f%f%f%f%f%f');

igood=1:2685;
ibad = find(xtemp==-99);
igood = setdiff(igood,ibad);
in = 1:length(igood);

TX(in,i)=xtemp(igood);
CX(in,i)=xcond(igood);
SX2(in,i)=xsal(igood);  %NB this has spikes, computing my own salinity
ZX(in,i)=xdepth(igood);
PX(in,i) = sw_dpth(ZX(in,i),66);
cndr = CX(in,1)/sw_c3515;
SX(in,i) = sw_salt(cndr,TX(in,i),PX(in,i));


% XCTD2_2021 - Apusek Fjord 

i=2;
[dum, dum, xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD-01 TSK 20210810182107_noheader.edf','%f%s%f%f%f%f%f%f%f');

igood = 1:2131;
ibad = find(xtemp==-99);
igood = setdiff(igood,ibad);
in = 1:length(igood);

TX(in,i)=xtemp(igood);
CX(in,i)=xcond(igood);
SX2(in,i)=xsal(igood);  
ZX(in,i)=xdepth(igood);
PX(in,i) = sw_dpth(ZX(in,i),66);
cndr = CX(in,i)/sw_c3515;
SX(in,i) = sw_salt(cndr,TX(in,i),PX(in,i));



 [dum, dum, xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD-01 TSK 20210811154859_noheader.edf','%f%s%f%f%f%f%f%f%f');
i=3;
igood = 1:4907;
ibad = find(xtemp==-99);
igood = setdiff(igood,ibad);
in = 1:length(igood);

TX(in,i)=xtemp(igood);
CX(in,i)=xcond(igood);
SX2(in,i)=xsal(igood);  %NB this has spikes, computing my own salinity
ZX(in,i)=xdepth(igood);
PX(in,i) = sw_dpth(ZX(in,i),66);
cndr = CX(in,i)/sw_c3515;
SX(in,i) = sw_salt(cndr,TX(in,i),PX(in,i));


[dum, dum, xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD-01 TSK 20210811155512_noheader.edf','%f%s%f%f%f%f%f%f%f');
i=4;
igood = 1:4970;
ibad = find(xtemp==-99);
igood = setdiff(igood,ibad);
in = 1:length(igood);

TX(in,i)=xtemp(igood);
CX(in,i)=xcond(igood);
SX2(in,i)=xsal(igood);  %NB this has spikes, computing my own salinity
ZX(in,i)=xdepth(igood);
PX(in,i) = sw_dpth(ZX(in,i),66);
cndr = CX(in,i)/sw_c3515;
SX(in,i) = sw_salt(cndr,TX(in,i),PX(in,i));


[dum, dum, xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD-01 TSK 20210811160148_noheader.edf','%f%s%f%f%f%f%f%f%f');
i=5;
igood = 1:4947;
ibad = find(xtemp==-99);
igood = setdiff(igood,ibad);
in = 1:length(igood);

TX(in,i)=xtemp(igood);
CX(in,i)=xcond(igood);
SX2(in,i)=xsal(igood);  %NB this has spikes, computing my own salinity
ZX(in,i)=xdepth(igood);
PX(in,i) = sw_dpth(ZX(in,i),66);
cndr = CX(in,i)/sw_c3515;
SX(in,i) = sw_salt(cndr,TX(in,i),PX(in,i));


[dum, dum, xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD-01 TSK 20210811160909_noheader.edf','%f%s%f%f%f%f%f%f%f');
i=6;
igood = 1:4715;
ibad = find(xtemp==-99);
igood = setdiff(igood,ibad);
in = 1:length(igood);

TX(in,i)=xtemp(igood);
CX(in,i)=xcond(igood);
SX2(in,i)=xsal(igood);  %NB this has spikes, computing my own salinity
ZX(in,i)=xdepth(igood);
PX(in,i) = sw_dpth(ZX(in,i),66);
cndr = CX(in,i)/sw_c3515;
SX(in,i) = sw_salt(cndr,TX(in,i),PX(in,i));


XCTDlon(1) = -1*[36+24.319/60];
XCTDlat(1) = 66+[03.338]/60;
XCTDdep(1) = 280;
XCTDtime(1) = datenum(2021,08,10,18,28,0);

XCTDlon(2) = -1*[36+27.092/60];
XCTDlat(2) = 65+[59.405]/60;
XCTDdep(2) = 350;
XCTDtime(2) = datenum(2021,08,10,18,55,0);

XCTDlon(3) = -1*[37+53.398/60];
XCTDlat(3) = 66+[20.016]/60;
XCTDdep(3) = 660;
XCTDtime(3) = datenum(2021,08,11,15,55,0);


XCTDlon(4) = -1*[37+48.775/60];
XCTDlat(4) = 66+[19.587]/60;
XCTDdep(4) = 650;
XCTDtime(4) = datenum(2021,08,11,16,2,0);


XCTDlon(5) = -1*[37+44.249/60];
XCTDlat(5) = 66+[20.018]/60;
XCTDdep(5) = 660;
XCTDtime(5) = datenum(2021,08,11,16,9,0);


XCTDlon(6) = -1*[37+40.476/60];
XCTDlat(6) = 66+[18.113]/60;
XCTDdep(6) = 640;
XCTDtime(6) = datenum(2021,08,11,16,16,0);




%save XCTD_2021_raw TX PX ZX SX SX2 CX XCTDlat XCTDlon XCTDtime XCTDdep;
%save XCTD_2021_binned Txctd PTxctd Pxctd Zxctd Sxctd XCTDlat XCTDlon XCTDtime XCTDdep;





%remove data from after it hit bottom
%k = find(SX<34 & ZX>160);
%SX(k) = NaN;
%TX(k) = NaN;
%ZX(k) = NaN;




%don't use SX2 - this is Fiamma's calculated version that used the old
%seawater routine. 

%this matches sippican calculated salinity.  
%s3 = gsw_SP_from_C(CX,TX,PX);


load /Users/jwholte/Dropbox/Work/greenland/SF2023/serm_mask.mat

load /Users/jwholte/Dropbox/Work/greenland/NNA/bedmachine_sermgridded.mat
k = find(isnan(bathyg)==1);
bathyg(k) = 0;

minlat = 65.35;
maxlat = 66.5;
minlon = -36.2;
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

figure
plot(SX,-ZX)


% now save in 1 m bins
depthbins = [1:2:899];

length(XCTDtime)

clear temp sal
for j = 1:length(XCTDtime)
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

temp(:,1:2) = NaN;
sal(:,1:2) = NaN;

%pres = sw_pres(depthbins',66);
pres = gsw_p_from_z(-depthbins',66);



outfile = 'Sermilik2021_XCTD.nc' 
delete(outfile)
instrument = 'Sippican XCTD-1 probes';
summary = 'Temperature and salinity profiles from 6 eXpendable Conductivity Temperature Depth (XCTD) 1 probes collected in Sermilik and Sermiligaaq Fjords, East Greenland, during August 2021.';
title = 'XCTD profiles of temperature and salinity from Sermilik and Sermiligaaq Fjords during August 2021';

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

    netcdf.putAtt(ncid,varid,'contributor_name','Fiamma Straneo, Jamie Holte, Margaret Lindeman, Aurora Roth');
    netcdf.putAtt(ncid,varid,'contributor_role','Principal Investigator and Data Collector, Data Processor, Data Processor, Data Processor');    
    
    netcdf.putAtt(ncid,varid,'creator_name','Dr. Fiamma Straneo, Professor');
    netcdf.putAtt(ncid,varid,'creator_email','fstraneo@seas.harvard.edu');
    netcdf.putAtt(ncid,varid,'creator_institution','Harvard University');

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
    netcdf.putVar(ncid, profile_ID,   1:length(XCTDlat));
    netcdf.putVar(ncid, latitude_ID,  XCTDlat);
    netcdf.putVar(ncid, longitude_ID, XCTDlon);    
    netcdf.putVar(ncid, sal_ID,       sal);
    netcdf.putVar(ncid, temp_ID,      temp);
    
netcdf.close(ncid);
ncdisp(outfile) 




clear date depth lat lon
date = XCTDtime;
depth = depthbins;
lat = XCTDlat;
lon = XCTDlon;
save('Sermilik2021_XCTD.mat','date','depth','lat','lon','pres','sal','temp') 






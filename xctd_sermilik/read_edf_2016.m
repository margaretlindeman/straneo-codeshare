% READ EDF files for 2016 XCTD files. 
%These files had their headers removed and resaved as XCTD1, XCTD2 etc

% XCTD header removed


Txctd(1:8000,1:16)=NaN;
Sxctd(1:8000,1:16)=NaN;
Zxctd(1:8000,1:16)=NaN;
Cxctd(1:8000,1:16)=NaN;


[xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD1.EDF','%f%f%f%f%f%f%f','delimiter',',');

in=1:3945;
Txctd(in,1)=xtemp(in);
Sxctd(in,1)=xsal(in);
Zxctd(in,1)=xdepth(in);
Cxctd(in,1)=xcond(in);

[xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD2.EDF','%f%f%f%f%f%f%f','delimiter',',');


in=1:4856;
Txctd(in,2)=xtemp(in);
Sxctd(in,2)=xsal(in);
Zxctd(in,2)=xdepth(in);
Cxctd(in,2)=xcond(in);

[xtime,xframe,xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD3.EDF','%f%8s%f%f%f%f%f%f%f','delimiter',',');

in=1:5043;
Txctd(in,3)=xtemp(in);
Sxctd(in,3)=xsal(in);
Zxctd(in,3)=xdepth(in);
Cxctd(in,3)=xcond(in);


[xtime,xframe,xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD4.EDF','%f%8s%f%f%f%f%f%f%f','delimiter',',');

in=1:4649;
Txctd(in,4)=xtemp(in);
Sxctd(in,4)=xsal(in);
Zxctd(in,4)=xdepth(in);
Cxctd(in,4)=xcond(in);

[xtime,xframe,xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD5.EDF','%f%8s%f%f%f%f%f%f%f','delimiter',',');

in=1:4903;
Txctd(in,5)=xtemp(in);
Sxctd(in,5)=xsal(in);
Zxctd(in,5)=xdepth(in);
Cxctd(in,5)=xcond(in);


[xtime,xframe,xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD6.EDF','%f%8s%f%f%f%f%f%f%f','delimiter',',');

in=1:4908;
Txctd(in,6)=xtemp(in);
Sxctd(in,6)=xsal(in);
Zxctd(in,6)=xdepth(in);
Cxctd(in,6)=xcond(in);

[xtime,xframe,xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD7.EDF','%f%8s%f%f%f%f%f%f%f','delimiter',',');

in=1:4140;
Txctd(in,7)=xtemp(in);
Sxctd(in,7)=xsal(in);
Zxctd(in,7)=xdepth(in);
Cxctd(in,7)=xcond(in);


[xtime,xframe,xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD8.EDF','%f%8s%f%f%f%f%f%f%f','delimiter',',');

in=1:4135;
Txctd(in,8)=xtemp(in);
Sxctd(in,8)=xsal(in);
Zxctd(in,8)=xdepth(in);
Cxctd(in,8)=xcond(in);

[xtime,xframe,xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD9.EDF','%f%8s%f%f%f%f%f%f%f','delimiter',',');

in=1:4969;
Txctd(in,9)=xtemp(in);
Sxctd(in,9)=xsal(in);
Zxctd(in,9)=xdepth(in);
Cxctd(in,9)=xcond(in);


[xtime,xframe,xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD10.EDF','%f%8s%f%f%f%f%f%f%f','delimiter',',');

in=1:2268;
Txctd(in,10)=xtemp(in);
Sxctd(in,10)=xsal(in);
Zxctd(in,10)=xdepth(in);
Cxctd(in,10)=xcond(in);

[xtime,xframe,xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD11.EDF','%f%8s%f%f%f%f%f%f%f','delimiter',',');

in=1:4970;
Txctd(in,11)=xtemp(in);
Sxctd(in,11)=xsal(in);
Zxctd(in,11)=xdepth(in);
Cxctd(in,11)=xcond(in);

[xtime,xframe,xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD12.EDF','%f%8s%f%f%f%f%f%f%f','delimiter',',');

in=1:2120;
Txctd(in,12)=xtemp(in);
Sxctd(in,12)=xsal(in);
Zxctd(in,12)=xdepth(in);
Cxctd(in,12)=xcond(in);

[xtime,xframe,xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD13.EDF','%f%8s%f%f%f%f%f%f%f','delimiter',',');

in=1:6690;
Txctd(in,13)=xtemp(in);
Sxctd(in,13)=xsal(in);
Zxctd(in,13)=xdepth(in);
Cxctd(in,13)=xcond(in);


[xtime,xframe,xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD14.EDF','%f%8s%f%f%f%f%f%f%f','delimiter',',');

in=1:6625;
Txctd(in,14)=xtemp(in);
Sxctd(in,14)=xsal(in);
Zxctd(in,14)=xdepth(in);
Cxctd(in,14)=xcond(in);

[xtime,xframe,xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD15.EDF','%f%8s%f%f%f%f%f%f%f','delimiter',',');

in=1:6460;
Txctd(in,15)=xtemp(in);
Sxctd(in,15)=xsal(in);
Zxctd(in,15)=xdepth(in);
Cxctd(in,15)=xcond(in);

[xtime,xframe,xdepth,xtemp,xcond,xsal,dum,dum,dum] = textread('XCTD16.EDF','%f%8s%f%f%f%f%f%f%f','delimiter',',');

in=1:862;
Txctd(in,16)=xtemp(in);
Sxctd(in,16)=xsal(in);
Zxctd(in,16)=xdepth(in);
Cxctd(in,16)=xcond(in);


Pxctd = sw_pres(Zxctd,[66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66]);

% % how good is the salinity calculated by Sippican?
% % ANSWER - it is pretty much the same so use Sippicans'
% cdrt = Cxctd/sw_c3515;
% Sxctd2 = sw_salt(cdrt,Txctd,Pxctd);
% PDxctd = sw_pden(Sxctd,Txctd,Pxctd,0)-1000;

PTxctd = sw_ptmp(Sxctd,Txctd,Pxctd,0);

Scalc = gsw_SP_from_C(Cxctd,Txctd,Pxctd);

clear dum iend igood ll ngood nsta nx PTxctd sdum xcond xdep xsal xtemp 


Xctdlat =65 + [81.93
 79.946
 81.824
 80.279
 80.115
 79.040
 74.525
 66.427
 57.390
 49.128
 31.614
 30.238
 37.612
 46.870
 53.835
 57.398]/60;

Xctdlon = [-38-09.7534/60
-37-53.958/60
-38-09.651/60
-37-56.895/60
-37-52.003/60
-37-44.653/60
-37-38.191/60
-37-45.372/60
-37-52.285/60
-37-57.341/60
-37-52.749/60
-37-58.048/60
-38-02.183/60
-37-59.027/60
-37-54.109/60
-37-44.850/60];


Xday = [9 9 10 10 10 10 10 10 10 10 11 11 11 11 11 12];
Xmonth = 8*ones(1,16);
Xyear = 2016*ones(1,16);
Xhour = [19
20
20
20
20
20
20
20
20
21
12
13
14
15
15
13]';

Xmin = [48
4
2
14
20
27
34
44
55
05
21
16
28
01
32
09]';

Xsec = 0*ones(1,16);
Xtime = datenum(Xyear,Xmonth,Xday,Xhour,Xmin,Xsec);

lat = Xctdlat;
lon = Xctdlon;

date = Xtime;



%Where are these profiles
figure; geoscatter(lat, lon)
%Check out profiles and figure out clipping data
%Plot Temp
figure; plot(Txctd,-1.*Zxctd);
%Plot Sal
figure; plot(Sxctd,-1.*Zxctd);

%Creates TS plot
figure; plot(Sxctd, Txctd)

%Determined from plots that the top 4 m (0-3.9m) of the data are before the probe
%has turned on and equilibrated. For all profiles we cut the top 4 m and
%replace with nans from indices 1 - 30. 

infill = nan(16,30)';
Txctd(1:30,:) = infill;

Sxctd(1:30,:) = infill;

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
for j = 1:16
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

pres = sw_pres(depthbins',66);


%Plot binned profiles
figure; plot(temp,-1.*depthbins);
figure; plot(sal,-1.*depthbins);
figure; plot(sal',temp');


Txctd = temp;
Sxctd = sal;
Pxctd = pres;
depth = depthbins;

XCTDtime = date;
XCTDlat = lat;
XCTDlon = lon;

clear infill Zxctd latxctd lonxctd Zbotxctd

%Create matfile with variables
save('Sermilik2016_XCTD.mat','depth','date','lat','lon','temp','sal','pres')

%CREATE NETCDF FILE FOR ARCHIVING - MUST EDIT FOR EACH YEAR

outfile = 'Sermilik2016_XCTD.nc' 
delete(outfile)
instrument = 'Sippican XCTD-1 probes';
summary = 'Temperature and salinity profiles from 16 eXpendable Conductivity Temperature Depth (XCTD) 1 probes collected in Sermilik Fjord, East Greenland, from August 9-11 2016.';
title = 'XCTD profiles of temperature and salinity from Sermilik Fjord during August 2016';

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

    netcdf.putAtt(ncid,varid,'contributor_name','Fiamma Straneo, Jamie Holte, Margaret Lindeman, Aurora Roth, Gordon Hamilton, Fiamma Straneo');
    netcdf.putAtt(ncid,varid,'contributor_role','Principal Investigator, Data Processor, Data Processor, Data Processor, Data Collector, Data Collector');

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
    netcdf.putVar(ncid, profile_ID,   1:16); %Need to change
    netcdf.putVar(ncid, latitude_ID,  XCTDlat);
    netcdf.putVar(ncid, longitude_ID, XCTDlon);    
    netcdf.putVar(ncid, sal_ID,       sal);
    netcdf.putVar(ncid, temp_ID,      temp);
    
netcdf.close(ncid);
ncdisp(outfile) 




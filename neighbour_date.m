function output=neighbour_date(filedir)
filelist = dir(strcat(filedir,'\*.png'));
output = cell(length(filelist),5);
for i=1:length(filelist)
    ImageName=filelist(i).name;
    fname=fullfile(filedir,ImageName);
    date=get_date_neighbour(fname);
    info=imfinfo(fname);
    Size=info.FileSize/1000;
    modDate=info.FileModDate;
    output{i,1}=[ImageName];
    output{i,2}=[date];
    output{i,3}=[modDate];
    output{i,5}=[Size];
    d=date(7:8);
    modD=modDate(1:2);
    modMin=str2num(modDate(16:17));
    modHour=str2num(modDate(13:14));
    if ~strcmp(d,modD)
        modHour=modHour+24;
    end
    date=str2num(date);
    min=mod(date,100);
    hour=(mod(date,10000)-min)/100;
    difference=(modHour-hour)*60+(modMin-min);
    difference=num2str(difference);
    output{i,4}=[difference];
end
[nrows,ncols]= size(output);
outputfile=strcat(filedir,'\date_neighbour.csv');
fid = fopen(outputfile, 'w');
for i=1:nrows
    
    fprintf(fid, '%s, ', output{i,1:ncols-1});
    fprintf(fid, '%s\n', output{i,ncols});
    
end
fclose(fid);
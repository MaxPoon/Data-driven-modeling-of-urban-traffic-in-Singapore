function output=numberOfImages(filedir)
filelist = dir(strcat(filedir,'\*.png'));
output=zeros(1,12);
for i=1:length(filelist)
    ImageName=filelist(i).name;
    fname=fullfile(filedir,ImageName);
    info=imfinfo(fname);
    date=info.FileModDate;
    month=date(4:6);
    switch month
        case 'Jan'
            output(1)=output(1)+1;
        case 'Feb'
            output(2)=output(2)+1;
        case 'Mar'
            output(3)=output(3)+1;
        case 'Apr'
            output(4)=output(4)+1;
        case 'May'
            output(5)=output(5)+1;
        case 'Jun'
            output(6)=output(6)+1;
        case 'Jul'
            output(7)=output(7)+1;
        case 'Aug'
            output(8)=output(8)+1;
        case 'Sep'
            output(9)=output(9)+1;
        case 'Oct'
            output(10)=output(10)+1;
        case 'Nov'
            output(11)=output(11)+1;
        case 'Dec'
            output(12)=output(12)+1;
    end
end
outputfile=strcat(filedir,'\numberOfImages.csv');
csvwrite(outputfile,output);
bar(output,1);
set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});


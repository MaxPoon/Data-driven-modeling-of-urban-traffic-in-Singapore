function dateNtime = get_date(imgfile)
[a,amap]=imread(imgfile);
argb=ind2rgb(a,amap);
agray=rgb2gray(argb);
acut=agray(1:40,390:510);
aocr=ocr(acut);
adate=cell2mat(aocr.Words(1));
ahour=cell2mat(aocr.Words(2));
amin=cell2mat(aocr.Words(3));
if ahour=='on'
    ahour='00';
end
dateNtime=[adate(1),adate(2),adate(3),adate(4),adate(6),adate(7),adate(9),adate(10),ahour,amin];


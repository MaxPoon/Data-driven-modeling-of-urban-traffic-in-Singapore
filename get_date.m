function dateNtime = get_date(imgfile)
[index,map]=imread(imgfile);
rgb = ind2rgb8(index,map);
m=[93 101 113 121 133 141 153 161 172 180]
for i= 1:10
    n(i)=getnumber(m(i),rgb);
    if n(i)=='5' || n(i)=='2'
        for j=i+1:10
            m(j)=m(j)-1;
        end
    end
end
dateNtime=['20',n];
%dateNtime=[n(5),n(6),'-',n(3),n(4),'-20',n(1),n(2),' ',n(7),n(8),':',n(9),n(10)];
%for i=1:10
%    dateNtime=dateNtime+n(i)*10^(10-i)
%end
%dateNtime=dateNtime+20*10^10;
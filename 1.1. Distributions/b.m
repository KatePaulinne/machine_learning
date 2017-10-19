function  b( n )
 
probDist=randn(n,1);
 
size(probDist);
 
figure('name','Task 3: Normal probability distribution', 'Numbertitle','off')
subplot(1,2,1);
hold on
h=plot(probDist,'b.');
%change the width of the axis
set(h,'linewidth',1);
labelPlot('Data point number','Data point value','Data normal raw data plot');
%xlabel('samples');
 
%plot histogram of dat as second figure
subplot(1,2,2);
%use n/2 as nbins
hist(probDist,n/2);
labelPlot('Data point value','Data point occurences','Data normal histogram');
 
end



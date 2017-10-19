function c( n )
 
probDist=randn(n,1);
 
size(probDist);
 
dataMean=mean(probDist,1);
dataVariance=var(probDist,1);
 
dataToPlot=gaussian_dist(probDist,dataMean,sqrt(dataVariance));
 
figure('name','Task 4: Estimate normal dustribution parameters', 'Numbertitle','off')
hold on
[data2,l]=histcounts(probDist,'Normalization','pdf');
%plot(probDist,dataToPlot,'.');
plot(l,[data2,0]);

[m,s]=hist(probDist,n*0.1);
%nPdf=normpdf(s)
nPdf=norm_dist(s);
plot(s,nPdf);

labelPlot('Data point value','Data point occurences','Fit data normal histogram');
legend('Normalized data histogram','Fitted');

%figure
%[m,s]=hist(probDist,n*0.1);
%nPdf=normpdf(s)
%bar(s,m/sum(m));
%plot(s,probDist);
%plot(s,nPdf);
 
end
 


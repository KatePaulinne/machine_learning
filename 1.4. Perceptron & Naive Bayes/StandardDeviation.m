function [standardDeviation,variance] = StandardDeviation( data )
    
    standardDeviation=0;
    
    %calculates standardDeviation (and variance) for both rows of the
    %dataset
    %mean=Mean(Mean(data),1);
    %meanb=mean(data,2);
    meanVal=CalcMean(data(:,:));
    dist=sum(abs(data(1,:)-meanVal(1,1)).^2,1);
    %dist1=sum((data(2,:)-mean).^2);
    %mean2=Mean(data,2);
    %meanb=calcMean(data(2,:));
    dist2=sum(abs(data(2,:)-meanVal(1,2)).^2,1);
    standardDeviation=[sqrt(sum(dist)./size(data,2)) sqrt(sum(dist2)./size(data,2))];
    variance=sum(dist)./size(data,2);
    
end


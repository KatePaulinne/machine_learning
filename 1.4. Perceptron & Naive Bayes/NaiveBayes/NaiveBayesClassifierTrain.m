function naiveBayes= NaiveBayesClassifierTrain( trainData, trainTarget ) %[meanVal1,stdevVal1,meanVal2,stdevVal2]=NaiveBayesClassifierTrain( trainData, trainTarget )
%NAIVEBAYESCLASSIFIER Summary of this function goes here
%   Detailed explanation goes here
    
    val1=[];
    val2=[];
    %find indexes for each data point that belong to the specific class
    [row, idx]=find((trainTarget(1,:)==1));
    [row, idx2]=find((trainTarget(2,:)==1));
    %divide the training set into two sets
    for i=1:size(trainData,2)
        for j=1:size(idx,2)
            if(i==idx(:,j))
                val1=[val1 trainData(:,idx(:,j))];
            end
        end
        for j=1:size(idx2,2)
            if(i==idx2(:,j))
                val2=[val2 trainData(:,idx2(:,j))];
            end
        end
    end
    
    %meanVal1=mean(val1,2);
    %varVal1=var(val1,0,2);
    %meanVal2=mean(val2,2);
    %varVal2=var(val2,0,2);
    
    %calculate mean and variance for each set and class (x is returned 
    %variance value but not used)
    meanVal1=CalcMean(val1);
    [stdevVal1,x]=StandardDeviation(val1);
    meanVal2=CalcMean(val2);
    [stdevVal2,x]=StandardDeviation(val2);
    %prior1=0.5;
    %prior2=0.5;
    %calculate priors for the training data
    prior1=size(val1,2)/size(trainData,2);
    prior2=size(val2,2)/size(trainData,2);
    
    %save all values into naive bayes cell array that is returned byt the
    %function
    naiveBayes{1}=meanVal1;
    naiveBayes{2}=stdevVal1;
    naiveBayes{3}=meanVal2;
    naiveBayes{4}=stdevVal2;
    naiveBayes{5}=prior1;
    naiveBayes{6}=prior2;
    
end


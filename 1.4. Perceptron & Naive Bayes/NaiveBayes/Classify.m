function classification = Classify( data, naiveBayes )

    %retrieve ll values from naive bayes structure
    meanValA=naiveBayes{1};
    meanValB=naiveBayes{3};
    stdevA=naiveBayes{2};
    stdevB=naiveBayes{4};
    priorA=naiveBayes{5};
    priorB=naiveBayes{6};
    
    %for i=size(data,2)
        %dataPoint=data(:,i);
        %probXGivenA=calcGaussian(dataPoint,meanValA,stdevA);
        %probXGivenB=calcGaussian(dataPoint,meanValB,stdevB);
        
        %probAGivenX=
        %probBGivenX=
    %end

    %calculate the probabilities of data given each class using 
    %Gaussian formula 
    probXGivenA=calcGaussian(data,meanValA,stdevA);
    probXGivenB=calcGaussian(data,meanValB,stdevB);

    %calculate the likelihood of each class given the data using naive
    %bayes rule
    probAGivenX=probXGivenA*priorA./(probXGivenA*priorA+probXGivenB*priorB);
    probBGivenX=probXGivenB*priorB./(probXGivenA*priorA+probXGivenB*priorB);
    
    classification=zeros(1,size(data,2));
    
    classification(1,sum(probAGivenX,2)>sum(probBGivenX,2))=1;
    
    %calculate the classification based on the dot product of the
    %probabilities of the data belonging to each class, this is because
    %there are two features in the dataset
    classification=[];
    %classification=sum(probAGivenX,2)>sum(probBGivenX,2);
    classification=probAGivenX(:,1).*probAGivenX(:,2)>probBGivenX(:,1).*probBGivenX(:,2);
end


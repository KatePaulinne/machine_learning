function perceptron=testPerceptron( perceptron,data,target )
    weights=perceptron{1};
    
    errorTest=[];
    outputPredicted=zeros(1,size(data,2)-1);
    %bias=ones(size(data,1),1);
    %data=[data bias];
    bias=ones(1,size(data,2));
    data=[data; bias];
    %calculate error for each testing sample
    for i=1:size(data,2)
        %outputPredicted(i,1)=sum(data(i,:).*weights(:,:));
        val=sum(data(:,i).*weights(:,:));
        %predictedOutput(i,1)=val;
        if(val>=1)
            outputPredicted(1,i)=1;
        else
            outputPredicted(1,i)=0;
        end
        errorTest=[errorTest target(1,i)-outputPredicted(1,i)];
    end
    %save error and predicted values
    perceptron{4}=errorTest;
    perceptron{5}=outputPredicted;
end


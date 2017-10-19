function perceptron = trainPerceptron( data,target, learningRate )

    
    maxIterations=200;
    bias=ones(1,size(data,2));
    data=[data; bias];
    %weights=customRand(0,0.01,1,size(data,2));
    weights=zeros(size(data,1),1);
    mse=[];
    predictedOutput=zeros(1,size(data,2)-1);
    %this loop trains the perceptron in maxIterations by djusting the
    %weights using the difference between actual output targets and outputs
    %predicted by the perceptron
    for k=1:maxIterations
        error=[];
        for i=1:size(data,2)
            %for k=1:size(data,2)
                %calculate desired output and threshold it
                val=sum(data(:,i).*weights(:,:));
                predictedOutput(1,i)=val;
                if(val>=1)
                    predictedOutput(1,i)=1;
                else
                    predictedOutput(1,i)=0;
                end
                %adjust weights
                for j=1:size(weights,1)
                    weights(j,1)=weights(j,1)+learningRate*(target(1,i)-predictedOutput(1,i))*data(j,i);
                    %weights(1,j)=weights(1,j)+learningRate*(target(i,1)-val)*data(i,j);
                end
            %end
            %calculate the error
            error=[error, target(1,i)-predictedOutput(1,i)];
        end
        %calculate mean error to keep track of all error values
        mse=[mse; sum(Mean(error,1).^2)];
    end
    
    %save weights and training error to the cell array
    perceptron{1}=weights;
    perceptron{2}=mse;
    perceptron{3}=predictedOutput;
end


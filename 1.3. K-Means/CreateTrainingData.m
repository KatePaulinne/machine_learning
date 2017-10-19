function  trainData=CreateTrainingData( data )
    
    %use created data returned by GenerateData function
    %assign all passed data from cell array into single matrix and plot it
    %as scatter plot
    trainData=[];
    for i=1:size(data,2)
        trainData=[trainData data{i}];
    end
 %TrainData=[first second];
 %TrainData=[first second third];
    figure
    scatter(trainData(1,:),trainData(2,:),'g','filled');
 %scatter(TrainData(1,:),TrainData(3,:),'g','filled');
 %scatter(first(:),second(:),'g','filled');
%plot(TrainData);
 %scatter(TrainData(1,:),'g','filled');
 %scatter(TrainData(:),TrainData(:),'g','filled');
%trainData=TrainData;
%trainData=[TrainData -TrainData];
 
end


function [trainingData, trainingTarget, testingData, testingTarget]=GenerateDataset()

    %set the number of samples for the training nd testing datasets (per class)
    trainingSamples=1000;
    testingSamples=100000;
    
    %use provided  function to generate gaussian data for training and
    %testing datasets using ppropriate number of samples
    [trainingData, trainingTarget]=GenerateGaussianData(trainingSamples);
    [testingData, testingTarget]=GenerateGaussianData(testingSamples);

    %figure
    %gscatter(trainingData(1,:),trainingData(2,:),trainingTarget(1,:));
    %figure
    %gscatter(testingData(1,:),testingData(2,:),testingTarget(1,:));
    
    %plot training and testing datasets using custom plot groups function
    PlotGroups(trainingData(1:2,:)',trainingTarget(1,:)');
    PlotGroups(testingData(1:2,:)',testingTarget(1,:)');
end


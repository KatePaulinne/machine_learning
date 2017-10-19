function RunNaiveBayes()

    %generate datasets with desired outputs (training and testing)
    [trainData, trainTarget, testData, testTarget]=GenerateDataset();
    
    %train naive bayes clssifier and return naive bayes cell array data 
    %structure containing means, standard deviations and priors for both 
    %classes in the training set  
    naiveBayesStruct=NaiveBayesClassifierTrain(trainData,trainTarget);
    %classify testing data using naive bayes structure returned by the
    %above function
    classification=Classify(testData,naiveBayesStruct);

    %plot classification groups by ussing classification returned by
    %classify function
    PlotGroups(testData',classification);
    %PlotGroups(testData',testTarget);
    %plot actual testing abouts for comparison
    PlotGroups(testData(1:2,:)',testTarget(1,:)');
end


function RunPerceptron()

    %generate datasets with desired outputs (training and testing)
    [trainingData, trainingTarget, testingData, testingTarget]=GenerateDataset();
    
    %set the learning rate to be 0.2
    learningRate=0.2;
    %train perceptron
    perceptron=trainPerceptron(trainingData,trainingTarget,learningRate);
    %test perceptron
    perceptron=testPerceptron(perceptron,testingData,testingTarget);
    
    %plot data using training and testing outcomes
    PlotGroups(trainingData',perceptron{3});
    PlotGroups(testingData',perceptron{5});

end


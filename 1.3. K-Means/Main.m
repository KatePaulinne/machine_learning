function Main()

    data=GenDataSet(10000);

    data=data(:,randperm(size(data,2)));
    idxEnd=size(data,2)*70/100;
    
    trainData=data(:,1:idxEnd);
    testData=data(:,idxEnd+1:end);
    
    centroids=KMeans(2,trainData);
    
    labels=getDataLabels(testData,centroids);
    labelRow=labels(3,:);
    figure
    hold on
    plot(testData(1,labelRow==1),testData(2,labelRow==1),'.g');
    plot(testData(1,labelRow==2),testData(2,labelRow==2),'.b');

    labels=getDataLabels(data,centroids);
    labelRow=labels(3,:);
    figure
    hold on
    plot(data(1,labelRow==1),data(2,labelRow==1),'.g');
    plot(data(1,labelRow==2),data(2,labelRow==2),'.b');
    %plot(data(1,labelRow==3),data(2,labelRow==3),'.y');
    %plot(data(1,labelRow==4),data(2,labelRow==4),'.r');
    %plot(data(1,labelRow==5),data(2,labelRow==5),'.m');

end


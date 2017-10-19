function centroids = KMeans( clusters, data )
    
    %assign number of clusters to variable k
    k=clusters;
    %centroids=(max(max(data))-min(min(data))).*randn(2,k)+min(min(data));
    %randomize centroids to put it as rndom point of dataset
    centroids=2.0.*randn(2,k) + [-4; 4];
    maxIterations=1000;
    %set iterations to 0 to make sure the algorithm runs at least once
    iterations=0;
    iteration=0;
    %sets;
    
    oldCentroids=centroids;
    
    %while(iterations<=maxIterations | oldCentroids~=centroids)
    %while((iterations==0 | oldCentroids~=centroids)& centroids)
    while(iterations==0 | oldCentroids~=centroids)
        %for i=1:size(data)
        %assign centroids to be old centroids 
        oldCentroids=centroids;
        %add 1 to iterations(for debugging)
        iterations=iterations+1;
        %sets{k}=[]
        %centroidI=randn(1,1);
        %centroids=[centroids; centroidI];
        
        %for i=1:size(data)
            
        %end
        %closest data label choose by clculating distances between
        %centroids and each data point using the below function
        labels=getDataLabels(data,centroids);

        %distance=sum(centroids - data(i,:));

        %assign centroids based on labels
        %and recalculate centroids values if needed base on the mean of the
        %set
        centroids=getCentroids(data,labels,k, oldCentroids,iteration);
        %end
    end
    
    %extract class labels from the labels
    labelRow=labels(3,:);
    %use labelRow as class labels to plot the data using scatter plot
    figure
    hold on
    %gscatter(labels(1,:),labels(2,:),labels(3,:));
    %scatter(data(1,labelRow==1),data(2,labelRow==1),5,'g','filled');
    %scatter(data(1,labelRow==2),data(2,labelRow==2),5,'b','filled');
    %scatter(data(1,labelRow==3),data(2,labelRow==3),5,'r','filled');
    plot(data(1,labelRow==1),data(2,labelRow==1),'.g');
    plot(data(1,labelRow==2),data(2,labelRow==2),'.b');

    
    %plots centroids (for debugging and testing)
    %scatter(centroids(1,1),centroids(2,1),100,'y','filled');
    %scatter(centroids(1,2),centroids(2,2),100,'y','filled');
    %scatter(centroids(1,3),centroids(2,3),100,'y','filled');
    plot(centroids(1,1),centroids(2,1),'.y');
    plot(centroids(1,2),centroids(2,2),'.y');
   
    %mean function needs fixing!!
    
end


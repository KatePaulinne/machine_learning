function labelledData2 = getDataLabels( data, centroids )
    %c=[centroids;centroids];
        
    for i=1:size(data,2)
        %find closest centroid by calculating distances between all
        %centroids and current data point 
        %[d,p]=min((centroids(1,:)-data(1,i)).^2+(centroids(2,:)-data(2,i)).^2);
        dist=(centroids(1,:)-data(1,i)).^2+(centroids(2,:)-data(2,i)).^2;
        %find the minimum distance and save the index and value of that
        %centroid
        [d,p]=min(dist);
        %label data
        %add current data point and closest centroid's index to labelledData2 
        %which is returned by the function at the end 
        if(i==1)
           labelledData=[data(:,i); centroids(:,p)]; 
           labelledData2=[data(:,i); p]; 
        else
           labelledData=[labelledData [data(:,i); centroids(:,p)]];
           labelledData2=[labelledData2 [data(:,i); p]];
        end
    end

end


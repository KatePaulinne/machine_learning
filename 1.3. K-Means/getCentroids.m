function centroids = getCentroids( data,labels,k, centroids,iteration)
    % the function recalulates the centroids position
    set=[];
    
    %for each centroid get the data that belongs to it and reclculate the
    %centroid centre by using the mean of the data
    for i=1:k
        count=0;
        for j=1:size(data,2)
            %centroids(i,:)=Mean(point);  
            if(labels(3,j)==i)
                if(count==0)
                    set=data(:,j);
                    count=count+1;
                else
                    set=[set data(:,j)];
                end           
            end
        end
        %centroids(1,i)=Mean(Mean(set),1);
        %centroids(2,i)=Mean(Mean(set),1);
        if(isempty(set))
            %centroids(1,i)=Mean(set(:,1));
            %centroids(2,i)=Mean(set(:,2));
            %centroids(:,i)=(max(max(data))-min(min(data))).*randn(2,1)+min(min(data));
            centroids(:,i)=2.0.*randn(2,1) + [-4; 4];

        else
            %meanVal=Mean(set(:,1));
            %centroids(1,i)=centroids(1,i)+meanVal;
            %meanVal=Mean(set(:,2));
            %centroids(2,i)=centroids(2,i)+meanVal;
            
            
            
            
            %meanVal=Mean(set(:,2));
            %centroids(2,i)=centroids(2,i)+Mean(set(:,2));
            %iteration=iteration+1;
            %disp(iteration);
            %centroids(:,i)=Mean(set,1);
            
            %using matlab mean
            %centroids(1,i)=mean(set(1,:));
            %centroids(2,i)=mean(set(2,:));
            
            %uses customly written mean function to calculate the mean of
            %the data and move the centres to the mean values
            centroids(1,i)=CalcMean(set(1,:));
            centroids(2,i)=CalcMean(set(2,:));
        end
        
        %clear the set temporary variable that holds  
        set=[];
    end

end


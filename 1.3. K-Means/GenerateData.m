function  data=GenerateData( n )

    %generate two or three sets with different mean and standard deviation
    %for training data nd plot results separately
     first=0.75.*randn(2,n) + [-4; -1];
     second=2.0.*randn(2,n) + [3; 4];
     %third=1.*randn(2,n) + [10; 12];

     figure
     hold on
     scatter(first(1,:),first(2,:),'g','filled');
     scatter(second(1,:),second(2,:),'r','filled');
     %scatter(third(1,:),third(2,:),'y','filled');

     data{1}=first;
     data{2}=second;
     %data{3}=third;
 
end


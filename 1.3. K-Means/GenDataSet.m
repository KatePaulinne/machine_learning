function  trainData=GenDataSet( n )

 first=0.75.*randn(2,n) + [-4; -1];
 second=2.0.*randn(2,n) + [3; 4];
 %third=1.*randn(2,n) + [10; 12];

 figure
 hold on
 scatter(first(1,:),first(2,:),'g','filled');
 scatter(second(1,:),second(2,:),'r','filled');
 %scatter(third(1,:),third(2,:),'y','filled');
 
 %vr1=first(:);
 %vr2=second(:);
 
 TrainData=[first second];
 %TrainData=[first second third];
 figure
 scatter(TrainData(1,:),TrainData(2,:),'g','filled');
 %scatter(TrainData(1,:),TrainData(3,:),'g','filled');
 %scatter(first(:),second(:),'g','filled');
%plot(TrainData);
 %scatter(TrainData(1,:),'g','filled');
 %scatter(TrainData(:),TrainData(:),'g','filled');
trainData=TrainData;
%trainData=[TrainData -TrainData];
 
end


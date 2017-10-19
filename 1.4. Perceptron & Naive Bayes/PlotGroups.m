function PlotGroups(x1,groups)

    %finds indexes of groups - used for debugging
    idx1=(groups==1);
    idx2=(groups==0);
    
    %plots data that belongs to different classes/groups using different
    %colours on the same figure using scatter plot
    figure
    hold on;
    %scatter(x1(groups==1,1),x1(groups==1,2),15,'r','filled');
    %scatter(x1(groups==0,1),x1(groups==0,2),15,'b','filled');
    
    plot(x1(groups==1,1),x1(groups==1,2),'.r');
    plot(x1(groups==0,1),x1(groups==0,2),'.b');
    %labelPlot( 'x-value', 'y-value' , 'Recognized on Testing Data' );
    %legend('Class 1', 'Class 2');
end


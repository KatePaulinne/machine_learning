function  ScatterPlot( x,y,labels )
%SCATTERPLOT Summary of this function goes here
%   Detailed explanation goes here
    figure
    %scatter(x,y,'filled');
    plot(x,y);
    labels=num2str(labels);
    text(x,y,labels);

end


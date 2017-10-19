function  meanVal=NoisyLine( n )
    
    %below makes sure x is in desired smple range
    x=linspace(-4,6);
    %x=-4:6;
    
    y1=1.6*x+6;
    
    %create noise using normal distribution
    noise=randn(1,n);
    
    %add noise to data
    y2=y1+noise;
    
    %plot data with noise
    figure('name','Task 1: Noisy Line','Numbertitle','off')
    hold on
    plot(x,y2,'b-o');
    plot(x,y1,'r');
    legend('raw data');

    
    meanVal=1-sum((y1-y2).^2)/sum((y1-mean(y1)).^2);

end


function NoisyQuadraticCurve( n )
    
    %create and plot noisy quadratic function
    x=linspace(-4,6);
    y=1.6*x.^2+2.5*x+6;
    
    noise=5.*randn(1,n);
    
    y2=y+noise;
    
    figure('name','Task 4: Noisy quadratic curve','Numbertitle','off')
    %subplot(1,2,1);
    plot(x,y2,'b-o');
    legend('raw data');
end


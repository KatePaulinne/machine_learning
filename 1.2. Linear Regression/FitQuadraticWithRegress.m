function  FitQuadraticWithRegress( n )

    %generate dataset
    x=linspace(-4,6);
    y=1.6*x.^2+2.5*x+6;
    
    noise=5.*randn(1,n);
    
    y2=y+noise;
    
    %calculate values for linear regress func
    XLin=[x; ones(1,n);];
    %r=regress(y2,XLin(1,:));
    r=regress(y2',XLin');
    
    %calculate values for quad linear func
    Quad=[x.*x;x;ones(1,n);];
    r2=regress(y2',Quad');
    
    %calculte end result for both methods
    y3=XLin'*r;
    y4=Quad'*r2;
    %plot the resukts
    figure('name','Task 5: Fit quadratic curve using linear regression','Numbertitle','off')
    %subplot(1,2,1);
    hold on 
    plot(x,y2,'b-o');
    plot(x,y3,'r');
    plot(x,y4,'g');
    %plot(x,r);
    %plot(x,XLin);
    %subplot(1,2,2);
   
    legend('raw data','fitted lin data', 'fitted quad data');

end


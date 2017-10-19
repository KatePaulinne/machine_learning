function a1(n)
    
    x=linspace(-4,6);
    %x=-4:6;
    y1=1.6*x+6;
    
    noise=randn(1,n);
    
    y2=y1+noise;
    
    figure
    hold on
    plot(x,y2,'b-o');
    plot(x,y1,'r');
    
    cycles=100;
    learningRate=0.001;
    for c=1:cycles
        uw=GetGradient(y, xf, w);
        w=w+learningRate*W;
        uy=w*xf;
        error(c)=GetError(y, xf, w);
    end
end


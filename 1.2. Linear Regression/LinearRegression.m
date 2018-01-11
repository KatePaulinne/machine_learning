function  LinearRegression(n)

    %Generate a noisy line
    x=linspace(-4,6);
    %second method to specify the range for x
    %x=-4:6;
    y1=1.6*x+6;
    
    noise=randn(1,n);
    
    y2=y1+noise;
    
    %calculte the weights for linear regression using matrix
    %transformations
    x2=[x; ones(1,size(x,2))];
    weights=inv(x2*x2')*x2*y2';
    yt=weights(1,1)*x+weights(2,1);
    
    %calculate the weights using gradient descent method (using getgradient
    %and geterror functions)
    w=0.0;
    w0=0.0;
    cycles=100;
    learningRate=0.001;
    %yu=y2;
    for c=1:cycles
        %W=GetGradient(y1(c), x(c), w, w0);
        W=GetGradient(y2, x, w, w0,'m');
        w=w-learningRate*W';
        W0=GetGradient(y2, x, w,w0,'c');
        w0=w0-learningRate*W0';
        yu=w*x+w0;
        error(c)=GetError(y2,x, w, w0);
        %disp(error(c));
        %disp(W);
        %disp(w);
        %disp(w0);
    end
    
    figure('name','Task 2 & 3: Linear Regression','Numbertitle','off')
    subplot(1,3,1);
    plot(error,'b-o');
    labelPlot('Iteration','Error value', 'Gradient Descent Error');
    subplot(1,3,2);
    hold on
    plot(x,y2,'b-o');
    plot(x,yu,'r');
    labelPlot('Data point number','Data point value', 'dataNormal raw data plot - weights found with gradient descent');
    legend('raw data','fitted data');
    subplot(1,3,3);
    hold on
    plot(x,y2,'b-o');
    plot(x,yt,'r');
    labelPlot('Data point number','Data point value', 'dataNormal raw data plot - weights found by inverse matrix multiplication');
    legend('raw data','fitted data');
end


function val = calcGaussian( x, mean, stdev)%var)

    %val=exp(-(sum((x-mean).^2)/2*var^2));
    
    expVal=exp(-((x'-mean).^2)./(2.*stdev.^2));
    val=(1./(sqrt(2*pi).*stdev)).*expVal;
    
    %val=exp(-((x'-mean).^2)./(2.*stdev.^2));
    
    %may need using bsxfun 
    %val=exp(-r*(sum((x-c).^2)));
    
end


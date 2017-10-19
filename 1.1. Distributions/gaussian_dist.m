function val=gaussian_dist( x,m,s )
 
    val=exp(-.5*((x-m)/s).^2)./(s*sqrt(2*pi));

end

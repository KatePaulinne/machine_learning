function gradient = GetGradient( yi, xi, m, c, type)
    %gradient=2*sum(-(xi.*(yi-(m.*xi))));
    
    %based on which parameter weight is being calculated choose appropriate
    %equation derivative to be used
    if(type=='c')
        gradient=2*sum(-(yi-(m.*xi+c)));
    elseif(type=='m')
        gradient=2*sum(-xi.*(yi-(m.*xi+c)));
    end
    
    %gradient=1-sum((yi-xi).^2)/sum((yi-mean(yi)).^2);

end


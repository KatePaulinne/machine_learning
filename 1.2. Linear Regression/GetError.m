function error = GetError( yi, xi, m, c)

    %calcultes the error over the passed iteration
    error=sum((yi-(m.*xi+c)).^2);
    %error=sum((yi-xi).^2);
    %error=1-sum((yi-xi).^2)/sum((yi-mean(yi)).^2);
    
end


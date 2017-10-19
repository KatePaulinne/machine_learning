function  mean=CalcMean( M )
    %calculates mean for all columns in one row data set
    mean=sum(M(1,:))/size(M,2);
end


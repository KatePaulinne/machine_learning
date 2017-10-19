function mean=Mean(varargin)
%MEAN pass matrix(required param!) and dimenion(row or columns) 
    M=varargin{1};
    if(length(varargin)==2)
        dim=varargin{2};
    else
        dim=2;
    end
    
    for i=1:size(M,dim)
        if(dim==1)
           val=sum(M(i,:))/size(M,2);        
        elseif(dim==2)
            val=sum(M(:,i))/size(M,1);
        elseif(dim==3)
            %val=sum(M(:,:))/(size(M,1)+size(M,2));
        end
        if(i==1)
            mean=val;
        else
            mean=[mean val];
        end
    end

end


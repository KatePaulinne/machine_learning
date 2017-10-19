function entropy = Entropy( M )

    %entropy=0;
    %sumEl=0;

    %for i=1:size(M,1)
        %for j=1:size(M,2)
            %sumEl=sumEl+M(i,j);
        %end
    %end

    %for i=1:size(M,1)
        %for j=1:size(M,2)
            %entropy=entropy+(M(i,j)/sumEl)*log2(M(i,j)/sumEl);
        %end
    %end

    %entropy=-entropy;
    %entropy=-sum(1./M.*log(1./M));
    %entropy=-sum(M(M~=0).*log(M(M~=0)));

    %calculates probabilities
    sum0=0;
    sum1=0;
    sum2=0;
    s=size(M(:,5));
    for i=1:s(1,1)
        if(M(i,5)==0)
            sum0=sum0+1;
        elseif(M(i,5)==1)
            sum1=sum1+1;
        else
            sum2=sum2+1;
        end
    end
    p0=sum0/s(1,1);
    p1=sum1/s(1,1);
    p2=sum2/s(1,1);
    
    %calculates entropy and also makes sure to deal with probability values
    %of 0
    if(p0==0)
        if(p1==0)
            if(p2==0)
                entropy=0;
            else
                entropy=-sum((p2*log2(p2)));
            end
        else
            if(p2==0)
                entropy=-sum((p1*log2(p1)));
            else
                entropy=-sum((p1*log2(p1))+(p2*log2(p2)));
            end
        end
    else
        if(p1==0)
            if(p2==0)
                entropy=-sum((p0*log2(p0)));
            else
                entropy=-sum((p0*log2(p0))+(p2*log2(p2)));
            end
        else
            if(p2==0)
                entropy=-sum((p0*log2(p0))+(p1*log2(p1)));
            else
                entropy=-sum((p0*log2(p0))+(p1*log2(p1))+(p2*log2(p2)));
            end
        end
    end  
    %entropy=-sum((p0*log2(p0))+(p1*log2(p1))+(p2*log2(p2)));
end


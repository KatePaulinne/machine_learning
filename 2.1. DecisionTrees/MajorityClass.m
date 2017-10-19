function name = MajorityClass( set )

    %calculates the number of occurences for each class in the set
    setosa=0;
    virginica=0;
    versicolor=0;
    for i=1:size(set,1)
        if(set(i,5)==0)
            setosa=setosa+1;
        elseif(set(i,5)==1)
            versicolor=versicolor+1;
        else
            virginica=virginica+1;
        end
    end

    %returns the class that has the highest number of occurences in the set
    [val,name]=max([setosa versicolor virginica]);
    name=name-1;
end


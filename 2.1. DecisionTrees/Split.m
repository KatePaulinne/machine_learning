function [setA, setB] = Split( set, index, val)

    setA=[];
    setB=[];

    %splits sets based on given rules (by index and value)
    [m,n]=size(set)
    for i=1:m
        if(set(i,index)<val)
            setA=[setA; set(i,:)];

        else
            setB=[setB; set(i,:)];
        end
    end

end


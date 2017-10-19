function l=NormaliseData( x )
    l=[];
    m=size(x)
    %normalises species data so that it can be merged into meas matrix and used
    %for splits etc.
    for i=1:m
        if(strcmp(x(i),'setosa'))
            l=[l; 0];
        elseif(strcmp(x(i),'versicolor'))
            l=[l; 1];
        else
            l=[l; 2];
        end
    end

end


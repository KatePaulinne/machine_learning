function observation = Observation( state )
%OBSERVATION Summary of this function goes here
%   Detailed explanation goes here
    
    %1,2,4,8 walls vals
    %matrix holding observation values
    world=[14,14,14,10,10,10,9,5,1,5,3];
    
    %returned observation
    observation=world(state);

end


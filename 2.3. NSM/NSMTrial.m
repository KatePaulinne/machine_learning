function [steps, LTM] = NSMTrial(  noEpisodes, goalState )
%NSMTRIAL Summary of this function goes here
%   Detailed explanation goes here

    LTM=[];
    steps=[];
    
    %run the passed number of episodes and create LTM matrix
    for i=1:noEpisodes
        [stepsEp,sLTM]=NSMEpisode(goalState,LTM);
        LTM=cat(3,LTM,sLTM);
        steps=[steps; stepsEp];
    end
    
    
end


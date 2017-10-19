function [steps, LTM] = RndTrial( noEpisodes, goalState )

    LTM=[];
    steps=[];
    
    %runs the number of passed in episodes and creates long term memory
    %matrix by adding episodes into 3 dim matrix
    for i=1:noEpisodes
        disp('trial');
        disp(i);
        [stepsEp,sLTM]=RndEpisode(goalState);
        LTM=cat(3,LTM,sLTM);
        steps=[steps; stepsEp];
    end
    

end


function [steps, recentEpisodes] = NSMEpisode( goalState, LTM )
    
    %choose a random start state that is not the goal state
    startState=StartState(golState,11);
    %set initial values
    discRewardInit=1.0;
    episode=[];
    currState=startState;
    
    %until the goal is reached continue choosing the next actions
    while(currState~=goalState)
        %get the observation for the current state
        currObservation=Observation(currState);
        %currAction=SelectActionRand();
        %currAction=NSMSelectAction(LTM, episode(size(episode,1),:),currObservation);
        %get the nextAction
        currAction=NSMSelectAction(LTM, episode,currObservation);
        %currObservation=Observation(currState);
        %add a step to the episode (STM)
        episode=[episode; currObservation, currAction, discRewardInit];
        %check the current state after theaction was taken
        currState=Transition(currState,currAction);
    end
    
    %calculate the discounted rewards for all steps of the episode starting
    %from the lst one
    for i=size(episode,1):-1:1
        if(i==size(episode,1))
            episode(i,3)=10;
        else  
            episode(i,3)=episode(i+1,3)-0.9;
        end
    end
    
    %if the steps in the matrix are not equal to 20 pad thematrix with 0s 
    %so tht the size of the episode matrix is always 20 (so that it can 
    %be added to LTM)
    if(size(episode,1)<20)
        episodesZeros=[];
        for j=1:20-size(episode,1)
            %episodes=[episodes; zeros(1,3)];
            episodesZeros=[episodesZeros; zeros(1,3)];
        end
        episode=[episodesZeros; episode];
    end
    
    %return recent 20 episodes and the number of steps taken for this
    %episode
    steps=size(episode,1);
    recentEpisodes=episode(end-19:end,:);


end


function [steps, recentEpisodes] = RndEpisode( goalState )
%RNDEPISODE Summary of this function goes here
%   Detailed explanation goes here

    startState=StartState(2,11);
    discRewardInit=1.0;
    episode=[];
    currState=startState;
    
    %creates episode matrix tht adds observation, action and initial eward
    %values and then changes the state to the next one given the action,
    %the loop continues until the goal is reached
    while(currState~=goalState)
        currAction=SelectActionRand();
        currObservation=Observation(currState);
        episode=[episode; currObservation, currAction, discRewardInit];
        currState=Transition(currState,currAction);
    end
    
    %adds discounted reward to each episode matrix starting from the 
    %last row
    for i=size(episode,1):-1:1
        if(i==size(episode,1))
            episode(i,3)=10;
        else  
            episode(i,3)=episode(i+1,3)-0.9;
        end
    end
    
    %if less than 20 steps were taken for episode it padds the row with
    %zeros 
    if(size(episode,1)<20)
        episodesZeros=[];
        for j=1:20-size(episode,1)
            %episodes=[episodes; zeros(1,3)];
            episodesZeros=[episodesZeros; zeros(1,3)];
        end
        episode=[episodesZeros; episode];
    end
    
    %returns the epsiode and steps
    steps=size(episode,1);
    recentEpisodes=episode(end-19:end,:);
end


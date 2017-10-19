function reward = Reward( state, action )
    
    %return reward=10 if state is 5 and action is 3 otherwise return 0 as
    %the reward
    if(state==5 && action==3)
        reward=10;
    else
        reward=0;
    end

end


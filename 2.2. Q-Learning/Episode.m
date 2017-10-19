function [countSteps, table]=Episode( goalState,qTable)
    %qTable=initQ(0.01,0.1,11,4);
    %goalState=2;
    countSteps=0;
    table=qTable;
    %stateCurrent=0;
    stateCurrent=StartState(goalState,11);
    %stateCurrent=1;
    %until current stte becomes goal state
    while(stateCurrent~=goalState)
        %select action
        action=SelectAction(table,stateCurrent);
        %calculate reward
        reward=Reward(stateCurrent,action);
        %find next state
        resultState=Transition(stateCurrent,action);
        %update QTable
        table=updateQ( table, stateCurrent, action, resultState, reward);
        %update current state
        stateCurrent=resultState;
        %add step to steps counter
        countSteps=countSteps+1;
    end
    

end


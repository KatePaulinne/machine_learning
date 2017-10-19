function [countSteps, table]=Episode( goalState,qTable)
    %qTable=initQ(0.01,0.1,11,4);
    %goalState=2;
    countSteps=0;
    table=qTable;
    %stateCurrent=0;
    stateCurrent=StartState(goalState,11);
    %stateCurrent=1;
    while(stateCurrent~=goalState)
        action=SelectAction(table,stateCurrent);
        reward=Reward(stateCurrent,action);
        resultState=Transition(stateCurrent,action);
        table=updateQ( table, stateCurrent, action, resultState, reward);
        stateCurrent=resultState;
        countSteps=countSteps+1;
    end
    

end


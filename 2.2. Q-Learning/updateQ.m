function tableQUpdated = updateQ( tableQ, state, action, resultState, reward)

    learningRate=0.2;
    discountRate=0.9;
    tableQUpdated=tableQ;
    %tableQUpdated(state,action)=tableQ(state,action)+learningRate.*(reward+discountRate.*max(tableQ(resultState,SelectAction(tableQ,resultState)))-tableQ(state,action));
    %tableQUpdated(state,action)=tableQ(state,action)+learningRate.*((reward+discountRate.*max(tableQ(resultState,:)))-tableQ(state,action));
    
    %update QTable values
    tableQUpdated(state,action)=tableQ(state,action)+learningRate.*(reward+discountRate.*max(tableQ(resultState,:))-tableQ(state,action));

end


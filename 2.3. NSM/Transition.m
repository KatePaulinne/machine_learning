function nextState = Transition( currentState, action )

    world2 =[4 1 1 1;
            5 2 2 2;
            6 3 3 3;
            7 4 4 1;
            9 5 5 2;
            11 6 6 3;
            7 8 4 7;
            8 9 8 7;
            9 10 5 8;
            10 11 10 9;
            11 11 6 10];
        
        %create the world where columns 1-4 are actions and rows 1-11 are
        %state indexes and value is the next state given current state and
        %action
        world =[4 1 1 1;
            5 2 2 2;
            6 3 3 3;
            7 4 1 4;
            9 5 2 5;
            11 6 3 6;
            7 8 4 7;
            8 9 8 7;
            9 10 5 8;
            10 11 10 9;
            11 11 6 10];
    %return the next action by looking it up in the world matrix
    nextState=world(currentState,action);

end


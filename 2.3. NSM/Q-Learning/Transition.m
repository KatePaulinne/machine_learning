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
    nextState=world(currentState,action);

end


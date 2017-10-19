function state= StartState( goal, stateNo )

    state=0;
    a=0;
    b=stateNo;
    cont=0;
    %choose a random start state that is not a goal and return it
    while(state==0 || cont==1)
        %state=round((b-a).*rand(1) + a);
        state=round(customRand(a,b,1,1));
        if(state==goal)
            cont=1;
        else
            cont=0;
        end
    end


end


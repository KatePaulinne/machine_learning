function action = SelectAction( tableQ, state)

    a=0;
    b=100;
    %chance=round((b-a).*rand(1,1) + a);
    chance=round(customRand(a,b,1,1));
    %chance=12;
    if(chance<=10)
        % 10% chance
        % random action
        %action=round((4-1).*rand(1,1)+1);
        action=round(customRand(1,4,1,1));
    else    
        % 90% chance
        % highest q value action
        [num,indx]=max(tableQ(state,:));
        action=indx;
    end
end


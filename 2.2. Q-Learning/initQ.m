function tableQ = initQ( min, max, stateNo, actionNo )

    %initialise QTable with random values between 0.01,0.1- passed in from
    %Trial
    a=min;
    b=max;
    %tableQ=(b-a).*rand(stateNo,actionNo) + a;
    tableQ=customRand(min,max,stateNo,actionNo);
    
    %figure 
    %mesh(stateNo,actionNo,tableQ);
    %mesh(stateNo,actionNo,tableQ);
    %x=linspace(1,stateNo);
    %y=linspace(0,1);
    %[X Y] = meshgrid(x,y);
    
    %uncomment
    %figure
    %surf(tableQ);
    %axis([1.0 4.0 1.0 10.0 0.0 1.0]);
end


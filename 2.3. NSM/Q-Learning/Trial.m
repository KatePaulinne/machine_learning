function  stepCounts=Trial( episodeNo )
    qTable=initQ(0.01,0.1,11,4);
    goalState=2;
    global once;
    global onceTrial;
    
    if(once==0)
        figure
        surf(qTable);
        axis([1.0 4.0 1.0 10.0 0.0 1.0]);
        once=1;
    end
    
    for i=1:episodeNo
        disp('Trial:');
        disp(i);
        [steps, qTable]=Episode(goalState,qTable);
        if(i==1)
            stepCounts=[steps];
        else
            stepCounts=[stepCounts steps];
        end
    end
    if(onceTrial==0)
        figure
        plot(stepCounts);
        onceTrial=1;
    end
end


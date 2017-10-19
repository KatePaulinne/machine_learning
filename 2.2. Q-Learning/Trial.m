function  stepCounts=Trial( episodeNo )
    
    %initialise qtable
    qTable=initQ(0.01,0.1,11,4);
    goalState=2;
    global once;
    global onceTrial;
    
    %plot qtable at first iteration
    if(once==0)
        figure
        surf(qTable);
        axis([1.0 4.0 1.0 10.0 0.0 1.0]);
        once=1;
    end
    
    %run all episodes in a Trial with updating QTable values and keeping
    %track of step counts
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
    
    %for the first iteration call of Trial plot step counts against
    %episodes
    if(onceTrial==0)
        figure
        plot(stepCounts);
        xlabel('Episode number');
        ylabel('Number of steps');
        title('Q-learning performance improvement');
        onceTrial=1;
    end
end


function NSMExperiment( trialNo,episodeNo,goalState )
    
    stepCounts=[]
    %runs all trials in experiment and saves values to plot(steps taken 
    %until goal was reached)
    for i=1:trialNo
        disp('Experiment:');
        disp(i);
        %stepCounts=Trial(episodeNo);
        %gets the LTM and the number of steps from the running one trial
        [count,LTM]=NSMTrial(episodeNo,goalState);
        %if(i==1)
         %   stepCounts=[count];
        %else
        %adds transposed number of steps into steps matrix to keep track 
        %of all values per experiment 
        stepCounts=[stepCounts; count'];
        %end
        %plot(count);
        %plot(stepCounts);
    end

    %calculates mean and standard deviation over steps taken and plots
    %values
    mn=mean(stepCounts);
    st=std(stepCounts);
    figure
    hold on
    plot(mn);
    plot(st);
    shadedErrorBar([],mn,st);
    %plot values
    %shadedErrorBar(trialNo,mn,st,'g');

end


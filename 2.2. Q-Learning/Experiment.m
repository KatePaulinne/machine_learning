function Experiment( trialNo, episodeNo )
    
    %used in Trial to only plot QTable initial once
    global once;
    global onceTrial;
    once=0;
    onceTrial=0;
    
    %runs all trials in experiment and saves values to plot(steps taken 
    %until goal was reached)
    for i=1:trialNo
        disp('Experiment:');
        disp(i);
        %stepCounts=Trial(episodeNo);
        count=Trial(episodeNo);
        if(i==1)
            stepCounts=[count];
        else
            stepCounts=[stepCounts; count];
        end
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
    xlabel('Episode number');
    ylabel('Number of steps');
    title('Mean and standard deviation of Q-Learning performance over 500 trials');
    %plot values
    %shadedErrorBar(trialNo,mn,st,'g');
end


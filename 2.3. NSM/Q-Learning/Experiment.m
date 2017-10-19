function Experiment( trialNo, episodeNo )
    global once;
    global onceTrial;
    once=0;
    onceTrial=0;
    
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

    mn=mean(stepCounts);
    st=std(stepCounts);
    figure
    hold on
    plot(mn);
    plot(st);
    %plot values
    %shadedErrorBar(trialNo,mn,st,'g');
end


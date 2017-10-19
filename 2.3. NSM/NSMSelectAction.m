function action = NSMSelectAction( LTM, STM,currObservation )

    a=0;
    b=100;
    %chance=round((b-a).*rand(1,1) + a);
    chance=round(customRand(a,b,1,1));
    %chance=12;
    discReward=[];
    if(chance<=10)
        % 10% chance
        % random action+
        %action=round((4-1).*rand(1,1)+1);
        action=round(customRand(1,4,1,1));
    else    
        % 90% chance
        
        
        %kNearest
        nearestSteps=kNearest(LTM,STM,currObservation);
        %calculate mean disc reward
        if(isempty(LTM)||isempty(nearestSteps))
            action=round(customRand(1,4,1,1));
        else
            means=[];
            for i=1:4
                reward=[];
                for j=1:size(nearestSteps,1)          
                    if(nearestSteps(j,2)==i)
                        %action=nearestSteps(j,2);
                        reward=[reward; [nearestSteps(j,3),nearestSteps(j,2)]]
                    %else
                        %reward=[reward; [0.0, nearestSteps(j,2)]];
                        %reward=[reward; [0.0, i]];
                    end
                end
                if(isempty(reward))
                    rewardMean=0.0;
                else
                    rewardMean=mean(reward(:,1));
                end
                means=[means; rewardMean]
            end

            %return action with highest value
            [idx,val]=max(means);
            [val,idx]=max(means);
            if(isempty(nearestSteps)||means(idx,1)==0)
                action=round(customRand(1,4,1,1));
            else
                %action=nearestSteps(idx,2);
                action=idx;
            end
        end
    end

end


function nearestSteps = kNearest(LTM, STM, currObservation)
%KNEAREST Summary of this function goes here
%   Detailed explanation goes here
    
    nearestSteps=[];
    %max k value - tested with various 2 seemed to work best otherwise the
    %algorithm was slow
    maxSteps=2;
    %goes through all steps in LTM 
    for i=1:size(LTM,3)
        for j=1:size(LTM,1)
            %proximity=Proximity(LTM,i,j,STM,LTM(j,1,i));
            %gets proximity for the current step in LTM
            proximity=Proximity(LTM,i,j,STM,currObservation);
            
            %if proximity is higher than 0 save the step to the nearest steps
            if(proximity>0)
                %nearestSteps=[nearestSteps; LTM(j,:,i) proximity];
            %end
                %if the nearest steps matrix contains maximum number of
                %nearest steps then check if the proximity value is higher
                %than the minimum proximity within the nearest steps vector
                %and if it is replace the step with the minimum proximity
                %value with the current step
                if(size(nearestSteps,1)==maxSteps)
                    [minVal, idx]=min(nearestSteps(:,4));
                    if(proximity>=minVal)
                        nearestSteps(idx,:)=[LTM(j,:,i) proximity];
                    end
                else
                    %otherwise the current LTM step is added to the nearest
                    %steps matrix
                    nearestSteps=[nearestSteps; LTM(j,:,i) proximity];
                end
            end
        end
    end
    
end


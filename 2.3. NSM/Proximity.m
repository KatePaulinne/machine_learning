function proximity = Proximity( LTM, idxLTM, idxStep, STM, observation)
    %matchLTM
    %LTM step, observation, action, discRew
    %proximity initialised to 0
    proximity=0.0;
    
    matchLTM=[];
    %for i=1:size(LTM,3)
        %for j=1:size(LTM,1)
            %for k=1:size(LTM,2)
                %if(LTM(j,1,i)==observation)
                %if(LTM(idxStep,idxLTM,i)==observation)
    %if the observation is the same as observation in LTM then set
    %proximity to 1 and check if previous steps match
    if(LTM(idxStep,1,idxLTM)==observation)    
        proximity=1;
        %if(LTM(j,k,i)==STM)
            %matchLTM=[matchLTM ];
        %end
        %check if previous steps match and if they do add 1 to proximity
        if(proximity>=1)
            stepIdxSTM=size(STM,1);
            stepIdx=idxStep;
            %for l=size(STM,1):-1:1
            %while(STM(stepIdxSTM,1)==LTM(j,k,i) && stepIdxSTM~=0)
            if(stepIdxSTM>0)
                %disp(STM);
                %disp(LTM);
                %disp(stepIdxSTM);
                %disp(stepIdx);
                %disp(idxLTM);
                %disp(size(LTM));
                %disp(size(STM));

                while(STM(stepIdxSTM,1)==LTM(stepIdx,1,idxLTM) && stepIdxSTM>1 && stepIdx>1)    
                    %disp(stepIdx);
                    proximity=proximity+1;
                    stepIdx=stepIdx-1;
                    stepIdxSTM=stepIdxSTM-1;
                    %knearest(?)
                end
            end
            %end
        %elseif()
        end
    end
            %end
        %end
    %end
    
    
end


function [ setA,setB,saveIndex,saveVal,maxVal,saveSetIdx,saveSet ] = maxSplit( subSetsArray )
    
    %global tree;
    %subsetsNo=1;
    maxVal=0;
    %maxImprov=0;
    %setCurr=setOrg;
    control=0;
    saveIndex=0;
    saveVal=0;
    valArray=[];
    %global setASave;
    %global setBSave;
    %while(maxImprov<=0)
    %loops through all sets, then all columns then all values to find the
    %best possible next split
    for setIndex=1:size(subSetsArray,2)%subsetsNo%size(set)
        %gets the set from the cell array
        set=subSetsArray{1,setIndex};
        for indexCol=1:size(set,2)-1
            valArray=[];
            for indexVal=1:size(set(:,indexCol))
            %minValue=min(set(:,indexCol));
            %maxValue=max(set(:,indexCol));
            %values=linspace(minValue,maxValue,((maxValue-minValue)*10+1)*2);
            %for indexVal=1:size(values,2)    
                %val=setCurr(indexVal,indexCol);
                %gets the value of a specific feature from the set
                val=[set(indexVal,indexCol) indexCol];
                %val=[values(1,indexVal) indexCol];
                %idx=indexVal;
                %if(isempty(find(valArray==val)&isempty(find(valArray==idx))))
                %checks if the value and feature was used already as a
                %splitting rule if it was it doesn't use it again (to optimize performance)
                if(isempty(valArray)|isempty(find(ismember(valArray,val,'rows'),1)))
                    %valArray=[valArray; val indexVal];
                    %saves the value into array that keeps track of used
                    %values and columns
                    valArray=[valArray; val];
                    %split set by val and index
                    [setA, setB]=Split( set, indexCol, val(1,1));
                    %calculates improvement
                    maxTmp=max(Improvement(set, setA, setB));
                    %if better then replace sets as a result of split with 
                    %split rules and overwrites varibles that are then
                    %returned by a function
                    if((maxVal<maxTmp && maxTmp>=0)||control==0)
                        setASave=setA;
                        setBSave=setB;
                        saveIndex=indexCol;
                        saveVal=val(1,1);0
                        maxVal=maxTmp;
                        saveSetIdx=setIndex;
                        saveSet=set;
                        if(control==0)
                            control=1;
                        end
                    end
                end
            end
        end
    end
        %if(isempty(tree))
            %tree=[setCurr setASave setBSave maxVal];
        %else
            %tree=[tree; setCurr setASave setBSave maxVal];
        %end
        %subsetsNo=subsetsNo+1;
    %end
    %assign sets to the sets tht are being returned
    setA=setASave;
    setB=setBSave;
end


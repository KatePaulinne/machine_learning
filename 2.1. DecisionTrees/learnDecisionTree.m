function tree=learnDecisionTree( M, s )

    %initialise variables for datasets
    global originalSet;
    global vectorNames;
    global normalisedDataSet;

    %assign matrices to global variables
    originalSet=M;
    vectorNames=s;

    %normlise species vector so that it can be added to meas matrix
    namesNormalised=NormaliseData(s);
    %add normalised names at the end of a matrix
    normalisedDataSet=[originalSet namesNormalised];

    %assign dataset to the cell array to keep track of datasets
    arrayOfSets{1}=normalisedDataSet;

    %[setA,setB]=Split(originalSet,size(originalSet)/2,);
    %arrayOfSets(arrayOfSets==originalSet)=setA;
    %arrayOfSets=[arrayOfsets; setB];
    %for i= 1:size(M)
        %l(i)=M(i,:);
    %end

    %Split();
    %Entropy();
    %Improvement();
    %MaxSplit();
 
    %initialise variables to keep track of the tree structure
    subsetsNo=1;
    maxVal=0;
    maxImprov=0.1;
    %setCurr=normalisedDataSet;
    global setASave;
    global setBSave;
    %tree=arrayOfSets;
    lastIdx=2;
    row=2;
    tree{1,1}=normalisedDataSet;
    tree{1,3}=1;
    tree{1,4}=-1;
    tree{1,5}=-1;
    tree{1,6}=-1;
    tree{1,7}=-1;
    tree{1,8}=-1;
    tree{1,9}=-1;
    indexesRow=[];
    indexesColumns=[];
    arrayOfSets2{1,1}=normalisedDataSet;
    %continue splitting the sets until there is no improvement
    while(maxImprov>0)
        %find the next best split for current existing sets
        [setASave, setBSave,saveIndex,saveVal,maxVal, saveSetIdx,saveSet]=maxSplit(arrayOfSets);
        %if(isempty(tree))
            %tree=[setCurr setASave setBSave maxVal];
            %arrayOfSets=[arrayOfSets; setASave; setBSave];
        %else
            %tree=[tree; setCurr setASave setBSave maxVal];
            %arrayOfSets=[arrayOfSets; setASave; setBSave];
        %
        
        %only update tree structure if there is improvement if not the
        %function should continue and terminate
        if(maxVal>0)
%             treeTmp{1}=setASave;
%             treeTmp{2}=setBSave;
             %keeps track of all current sets by replacing the set that was
             %split and adding a new one at the end of cell array
             arrayOfSets{1,saveSetIdx}=setASave;
             arrayOfSets{1,lastIdx}=setBSave;
%             treeTmp{3}=saveIndex;
%             treeTmp{4}=saveVal;
%             treeTmp{5}=maxVal;

            %tree{saveSetIdx}=treeTmp;
            
            %keeps track of all sets that ever existed - this is for
            %calculating the parent node indexes for the tree structure
            arrayOfSets2{1,lastIdx}=setASave;
            arrayOfSets2{1,lastIdx+1}=setBSave;


            %saves the tree values into cell array that is returned by the
            %function
            %first saves new sets that were created because of splitting a
            %parent set
            tree{row,1}=setASave;
            tree{row,2}=setBSave;
            %treeTest{row,3}=saveSetIdx;
            %treeTest{row,4}=lastIdx;
            
            %figures out row index of the parent and saves it into tree
            %structure
            temp=tree(:,1:2);
            idxToSave=find(cellfun(@(x) isequal(x,saveSet), arrayOfSets2));
            %mtrix keeps track of prent row indexes
            indexesRow=[indexesRow; round((idxToSave-1)/2)];
            tree{row,3}=round((idxToSave-1)/2);
            %figures out parent node column index and saves it to tree
            %structure
            if(mod(idxToSave,2)==0 | idxToSave==1)
                indexesColumns=[indexesColumns; 1];  
                tree{row,4}=1;
            else
                indexesColumns=[indexesColumns; 2];
                tree{row,4}=2;
            end

            %saves other values into the tree structure - split rules for
            %the sets, improvement value and majority classes for added sets
            tree{row,5}=saveIndex;
            tree{row,6}=saveVal;
            tree{row,7}=maxVal;
            tree{row,8}=MajorityClass(setASave);
            tree{row,9}=MajorityClass(setBSave);

            
            %treeTmp=[];
            %increases variables for the next iteration
            subsetsNo=subsetsNo+1;
            lastIdx=lastIdx+2;
            row=row+1;
        end
        
        %assigns improvement value to the variable that the loop
        %termination depends on
        maxImprov=maxVal;
    end


end


function classification = Classify( tree, data )

    %starts with 2nd iteration as that's the first brnch of the tree
    iteration=2;
    classified=0;
    classIdx=8;
    %while loop continues until a the data has been classified or the
    %number of iterations exceeds the last row of the tree structure
    while(iteration~=9 & classified==0)
        %tree{}
        %checks the value against split rule and assigns the index of the 
        %next split branch (to find child node of the tree for that split) 
        if(data(1,tree{iteration,5})<tree{iteration,6})
            %tree{iteration,1}
            col=1;
            classIdx=8;
        else
            col=2;
            %tree{iteration,2}
            classIdx=9;
        end
        %finds the next tree branch 
        f=find([tree{:,3}]==(iteration-1));
        t=find([tree{f,4}]==col);
        %if there is no tree branch available with those values it means
        %the clssification has finished - assigns the majority class of the
        %given set to be the classification for the data, else changes
        %iteration number to the current row in the tree structure
        if(isempty(f(1,t)))
            classified=1;
            class=tree{iteration,classIdx};
        else
            iteration=f(1,t);
        end
    end
    
    %checks the unnormalized name of the class and returns the string
    if(class==0)
        classification='setosa';
    elseif(class==1)
        classification='versicolor';
    else
        classification='virginica';
    end
end


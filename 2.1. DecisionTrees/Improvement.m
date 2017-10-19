function entropyChange = Improvement( orgSet, set1, set2 )
    %if one of the sets is empty returns 0
    entropyChange=0;
    if(~isempty(orgSet)&&~isempty(set1)&&~isempty(set2))
        
        %calculates entropies
        orgEnt=Entropy(orgSet);
        ent1=Entropy(set1);
        ent2=Entropy(set2);
        
        %calculates improvement based on entropy values of all sets that is
        %scaled by each sets size in omprison to original set
        sizeOrg=size(orgSet(:,1));
        size1=size(set1(:,1))/sizeOrg;
        size2=size(set2(:,1))/sizeOrg;
        %entropyChange=orgEnt-sum((orgSet./set1).*ent1,(orgSet./set2).*ent2);
        entropyChange=orgEnt-(ent1*size1+ent2*size2);
    end
end


function yes = vectIsSubsOfElement(mat,vect)
    yes = 0;
    vect = vect(find(vect~=0));
    vect = vect(1:end-1);
    
    for k = 1:size(mat,1)
        vectTest= mat(k,:);
        vectTest = vectTest(find(vectTest~=0));
        vectTest = vectTest(1:end-1);
        if(numel(vectTest)==numel(vect))
           yes = isSubs(vectTest,vect);
           if(yes)
               return
           end
        end
    end

end

function rings = findRings(map)
    rings = [];
    ringSub = [];
    nbElem = size(map,1);
    for i = 1:nbElem
        newRing = ring(map,i);
        
        % dealing with the case that 'newRing' and 'ringSub' are not of
        % same length
        if(size(newRing,2)~=size(ringSub,2))
           diff = size(newRing,2)-size(ringSub,2);
           if(diff>0)
              ringSub = [ringSub zeros(size(ringSub,1),diff)];
           else
              newRing = [newRing zeros(size(newRing,1),-diff)];               
           end
        end
        
        ringSub = [ringSub;newRing];
    end
    
    % deleting repeated rings  
    if(numel(ringSub)>0)  
        
        rings = ringSub(1,:);
        for k = 1:size(ringSub,1)
            vect = ringSub(k,:);
            if(~vectIsSubsOfElement(rings,vect))
                rings = [rings;vect];
            end 
        end        
    end    
end 


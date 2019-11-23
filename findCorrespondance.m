function correspondances = findCorrespondance(map)
    correspondances = [];
    correspondanceSub = [];
    
    nbElem = size(map,1);
    for i = 1:nbElem
        path = dfsBalance(map,i);   
        
        % dealing with the case that 'path' and 'correspondanceSub' are not of
        % same length
        if(size(path,2)~=size(correspondanceSub,2))
           diff = size(path,2)-size(correspondanceSub,2);
           if(diff>0)
              correspondanceSub = [correspondanceSub zeros(size(correspondanceSub,1),diff)];
           else
              path = [path zeros(size(path,1),-diff)];               
           end
        end
        
        correspondanceSub = [correspondanceSub;path];         
    end
    
    correspondanceSub = correspondanceSub(:,(2:end));
    
    % deleting singular path
    for k = 1:size(correspondanceSub,1)  
        path = correspondanceSub(k,:);
        pathNoNull = path(find(path~=0));
        if(numel(pathNoNull)>=3)
           correspondances = [correspondances;path];
        end
    end
end
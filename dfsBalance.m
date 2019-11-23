function path = dfsBalance(map,root)
    % the first element of each line in path represents the state of this
    % line : 
    %   if 0, this line is growing 
    %   if 1, this line stops growing with finding a ring
    %         [found a repeated element which is the root]
    %   if 2, this line stops growing without finding a ring
    %         [found a repeated element which is not the root]

    path  = [0 root];
    % judging that if every line stops growing 
    while(sum(path(:,1)==0)~=0)
        newPath=[];
        % expand every single path in 'path'
        for k = 1:size(path,1)
            newPathElement = path(k,:);
            
            % if this path is still expanable 
            %if(path(k,1)==0) 
                % expanation directions

                % if this path is not expanable
                if(newPathElement(1)~=0)
                    newPathElement = [newPathElement 0];
                    
                % else if this path is expanable 
                else 
                    growth = map(path(k,end),:);
                    index = find(growth~=0);
                    
                    % and we find some direction to expand 
                    if(numel(index)~=0)
                        newPathElement = repmat(newPathElement,numel(index),1);
                        newPathElement = [newPathElement (index)'];
                        for i = 1:numel(index)

                            % if the new element is repeated in the list
                            if(isVectInMatrix((newPathElement(i,1:end-1)'),newPathElement(i,end))==1)
                                if(newPathElement(i,end)==root)
                                    newPathElement(i,1)=1;
                                else
                                    newPathElement(i,1)=2;
                                end
                            end
                        end
                    
                    % logically expanable but we find no direction to
                    % expand 
                    else
                        newPathElement = [newPathElement 0];
                        newPathElement(1) = 2;
                    end
                end 
                     
            %end
            
            newPath = [newPath; newPathElement];    
        end 
        path = newPath;
    end 

end
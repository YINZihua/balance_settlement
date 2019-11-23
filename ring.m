function rings = ring(map,root)
    path = dfsBalance(map,root);
    % get all detected rings (repeating eventually)
    index = find(path(:,1)==1);
    rings = path(index,:);
    rings = rings(:,(2:end));
end 
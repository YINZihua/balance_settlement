function map = deletePath(map,path)    
    path = path(find(path~=0));
    path = [path(1:end-1)' path(2:end)'];
    
    ind = sub2ind(size(map),path(:,1),path(:,2));
    values = map(ind);
    minVal = min(values);
    
    map(ind) = map(ind)-minVal;
end
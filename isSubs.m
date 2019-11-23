function yes = isSubs(vec1, vec2)
    yes = 0;
    if(vec1 == vec2)
        yes = 1;
    end
    for k = 1:length(vec1)-1
        if([vec1(k+1:end) vec1(1:k)]==vec2)
            yes = 1;
            return 
        end
    end
end 
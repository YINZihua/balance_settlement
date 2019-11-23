function isElem = isVectInMatrix(mat,vect)
    mat = mat - repmat(vect,size(mat,1),1);
    mat = mat.^2;
    isElem = 1*(min(mat)==0);
end 
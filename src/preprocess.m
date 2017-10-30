function img = preprocess(img)
    img = 2*img(:,:,3)-img(:,:,1)-img(:,:,2);
    img = imbinarize(img);
    se = strel(ones(2,2));
    img = imerode(img,se);
    img = imdilate(img,se);
end
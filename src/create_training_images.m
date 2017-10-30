function images = create_training_images()
    imagefiles = dir('*.jpg');      
    nfiles = length(imagefiles);
    images = cell([1 nfiles]);
    
    for ii=1:nfiles
       currentfilename = strcat(int2str(ii-1),'.jpg');
       currentimage = imread(currentfilename);
       images{ii} = currentimage;
    end
    
    count = 0;
    for ii=1:nfiles
        letters = extract_letter(preprocess(images{ii}));
        for j = 1:6
            name = strcat('../Training_images/',int2str(count + j),'.jpg');
            imwrite(letters(:,:,j),name);
        end
        count = count + 6;
    end
    
    imagefiles = dir('../Training_images/*.jpg');      
    nfiles = length(imagefiles);
    
    for j = 1:nfiles
        name = strcat('../Training_images/',int2str(j),'.jpg');
        images{j} = imread(name);
    end
end


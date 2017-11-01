function result = extract_letter(img)
    j = 1;
    count = 0;
    result = zeros(40,40,6);
    while(j <= size(img,2))
        jump = 0;
        for i = 1:size(img,1)
            if img(i,j)
                count = count + 1;
                [jump,i_min,i_max] = detect_letter(img,j,i);
                result(:,:,count) = imresize(img(i_min:i_max , j:jump),[40 40]);
                break;
            end
        end
        if ~jump 
            j = j + 1;
        else
            j = jump;
        end
    end
end

function [j,i_min,i_max] = detect_letter(img,j_i,i)
    i_min = i;
    i_max = i;
    for j = j_i:size(img,2)
        flag = 0;
        for i = 1:size(img,1)
            if img(i,j)
                flag = 1;
                if i < i_min
                    i_min = i;
                elseif i > i_max
                    i_max = i;
                end
            end
        end
        if ~flag
            return;
        end
    end
end
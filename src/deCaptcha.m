function out = deCaptcha(img,deepnet)
    letters = extract_letter(preprocess(img)) * 255;
    out = '';
    for i = 1:5
        test = letters(:,:,i);
        [a,b] = max(deepnet(test(:)));
        if b < 10
            out = strcat(out,int2str(b));
        elseif b>10
            out = strcat(out,char(b+86));
        else
            out = strcat(out,'0');
        end
    end      
end


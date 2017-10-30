function Train = create_training_code()
    fileID = fopen('code1.txt','r');
    A = fscanf(fileID,'%c',[1 Inf]);
    
    X = zeros(size(A));
    for i=1:9
        X(A == int2str(i)) = i;
    end
    X(A == '0') = 10;
    for i='a':'z'
        X(A == i) = double(i) - 86;
    end
    
    Train = zeros(36,30000);
    for i=1:30000
        Train(X(i),i) = 1;
    end
end


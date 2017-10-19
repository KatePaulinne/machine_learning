function w = trainTest(input, target)
    %learning rate
    lr = 0.2;
    %initialise error rate 
    % -- er = zeros(size(input,2),1);
    er = zeros(1,size(input,2));
    %iterations
    itr = 100;
    %initialise weights
    %w = rand(1, 2)/10;
    w = zeros(1, size(input,1));
    
    mse = zeros(itr,1);
    
    %for a set amount of iterations
    for i = 1:itr
        %for each input
        for j = 1:size(input,2)
            %predicted output before threshold
            output = sum(input(:,j) .* w');
            if output >= 1
                %z is predicted output after threshold
            	z = 1;
            else
            	z = 0;
            end
            %for each weight
            for k = 1:size(w,2)
                %update weights - Learning Rule
                w(1,k) = w(1,k) + lr * (target(1,j) - z) * input(k,j);                
            end
            %update error rates
            er(1,j) = target(1,j) - z;
        end
        
        %gradient descent error
        mse(i) = sum(mean(er).^2);
    end 
    plot(mse);
end





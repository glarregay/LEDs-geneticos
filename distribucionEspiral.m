function pos = distribucionEspiral(n, radio, fsep, altura)

    pos = zeros(n, 3);
    pos(:,3) = altura*ones(n,1);
    rt = zeros(n, 2);
    
    for i=0:n-1
        tita = i * 2.3999; % Angulo "de oro" -- Phyllotaxis
        r = sqrt(tita);
        rt(i+1, :) = [r tita];
    end
    
%     fs = linspace(-pi/2, pi/2, n+1);
%     fs = 1-cos(fs(2:end-1)).^fsep;
%     fs = fs/sum(fs);
%     fs = ones(1,length(fs)+1) - [0 cumsum(fs)];
        
    %rt(:,1) = rt(:,1) + fs'.*rt(:,1);
    rtnorm = rt(:,1)/max(rt(:,1));
    rt(:,1) = radio*((rtnorm).^fsep);
    %rt(:,1) = radio * fs';
    [x, y] = pol2cart(rt(:,2), rt(:,1));
    pos(:, 1:2) = [x y]; 
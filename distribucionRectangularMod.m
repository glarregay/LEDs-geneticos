function pos = distribucionRectangularMod(n, m, dimx, dimy, fsep, altura)

    pos = zeros(n*m, 3);
    pos(:,3) = altura*ones(n*m,1);
    
    % dimx y dimy son vectores de 2x1, que marcan los límites en las
    % coordenadas x e y respectivamente
    
    dx = (dimx(2) - dimx(1));
    dy = (dimy(2) - dimy(1));
    k = 1;
    
    % Calculo los espacios entre coordenadas
    ex = linspace(-pi/2, pi/2, n+1);
    ex = cos(ex(2:end-1)).^fsep;
    ex = ex/sum(ex);
    ex = [0 cumsum(ex)];
    
    ey = linspace(-pi/2, pi/2, m+1);
    ey = cos(ey(2:end-1)).^fsep;
    ey = ey/sum(ey);
    ey = [0 cumsum(ey)];
    
    for i = 1:n
        for j = 1:m
            cx = dimx(1) + dx*ex(i);
            cy = dimy(1) + dy*ey(j);
            pos(k, 1:2) = [cx cy];
            k = k+1;
        end
    end
            

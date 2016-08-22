function testLED()
    % Iluminancia maxima de cada LED
    I0 = 80;

	% Posicion del LED y punto sobre el tablero al que apunta
    LP = [ -0.005 -0.007 0.27];
    LD = [ -0.005 -0.007 0 ];
    
    mediciones = ...
      [  8  9 10 12  13  15  16  17  18  21  19  17  16  13  13 11 10  8
         8 11 12 15  16  20  24  27  33  39  35  27  25  19  16 13 11 10
        10 13 15 19  23  34  48  61  68  76  69  56  41  29  20 16 13 12
        12 14 19 27  37  63  81 115 149 162 146 107  76  52  33 21 17 15
        12 15 20 37  62 112 174 240 283 302 260 191 137  88  54 32 20 17
        13 18 30 57 105 165 286 393 460 460 390 306 222 157  82 53 29 21
        14 20 33 73 141 271 425 583 679 676 562 426 296 205 112 68 38 24
        15 23 44 90 175 333 525 744 894 839 690 525 355 233 137 77 41 24
        15 24 45 91 182 353 562 797 920 875 721 561 392 249 152 84 43 23
        15 24 44 93 161 302 479 695 787 762 654 507 372 233 140 70 37 21
        15 21 34 69 124 236 383 525 615 586 552 452 303 202 110 56 29 18
        15 19 31 61  90 159 258 358 442 463 433 333 239 146  81 43 22 16
        14 15 22 36  66 101 157 223 281 266 250 203 143  90  55 28 18 15
        13 14 17 26  38  54  84 116 138 139 131 110  82  56  31 20 15 12
        11 11 14 17  21  31  45  60  67  76  76  59  46  35  20 16 12 10
         8  9 11 13  17  19  24  30  32  35  35  29  23  19  15 13 11  9
         7  8  9 11  12  14  16  19  20  22  20  18  16  14  12 10  9  8
         6  7  8  9   9  10  12  13  14  14  13  12  12  11   9  9  8  7 ];
         
    % Rango del tablero
    rangox = 0.17/2;
    rangoy = 0.17/2;
    res    = 0.01;
    
	% Grilla de los puntos de medicion
    x = -rangox:res:rangox;
    y = -rangoy:res:rangoy;
    [X,Y] = meshgrid(x,y);
    grilla = zeros(length(x)*length(y),3);
    Zh = zeros(length(x), length(y));
    k=1;
    
    figure
    hold on;
    grid on;
    view(60,30);
    colormap gray;
    surf(X,Y,mediciones, 'EdgeColor', 'None');
    contour(X,Y,mediciones);
    axis square;
    axis([-rangox rangox -rangoy rangoy 0 1000]);

    print -dpng mediciones.png
    
    for i = 1:length(x)
        for j = 1:length(y)
            grilla(k,:) = [x(i) y(j) 0];
            k = k+1;
        end
    end

    emc = inf;
    mejorI0 = 0;
    mejorang = 0;
    mejorx = 0;
    mejory = 0;
    
	% Buscar los parametros mas cercanos del modelo buscando el menor error medio cuadratico
    for I0 = 63.8:.005:63.9
      for ledang = 6.76:.001:6.77
        for posx = 0.0013:-0.00005:0.0011
          for posy = -0.00575:-0.00001:-0.0058
          
            LP = [posx posy 0.27];
            LD = [posx posy 0];
            
            vecLED = LD - LP;
            vecLEDm = sqrt(sum(vecLED.^2,2));
            
            dist = grilla(1:end, :) - repmat(LP, length(grilla), 1);
            pint = vecLED*dist';
            mods = vecLEDm * sqrt(sum(dist.^2,2));
            ang  = pint./mods';
            angulo = real(acos(ang));
            lumh   = modeloLED(I0, ledang*pi/180, angulo) .* cos(angulo).^3 / LP(3).^2;
            Zh = reshape(lumh, [length(x) length(y)]);
        
            dif = abs((mediciones - Zh).^2);
            val = sum(sum(dif));
            
            if val < emc
                emc = val;
                mejorI0 = I0;
                mejorang = ledang;
                mejorx = posx;
                mejory = posy;
            end
          end
        end
      end
    end 
    
    LP = [mejorx mejory 0.27];
    LD = [mejorx mejory 0];
    
    vecLED = LD - LP;
    vecLEDm = sqrt(sum(vecLED.^2,2));
            
    dist = grilla(1:end, :) - repmat(LP, length(grilla), 1);
    pint = vecLED*dist';
    mods = vecLEDm * sqrt(sum(dist.^2,2));
    ang  = pint./mods';
    angulo = real(acos(ang));
    lumh   = modeloLED(mejorI0, mejorang*pi/180, angulo) .* cos(angulo).^3 / LP(3).^2;
    Zh = reshape(lumh, [length(x) length(y)]);
    
    mx = max(max(Zh));
    mn = min(min(Zh));
    av = mean(mean(Zh));
    disp(['Media: ' num2str(av)]);
    disp(['Maximo y minimo ' num2str(mx) ':' num2str(mn) ' (' num2str(abs(mn-mx)) ')']);
    disp(['Relacion ' num2str(mx/mn)]);
    disp("--");
    disp(['Error medio ' num2str(emc)]);
    disp(['I0 del modelo ' num2str(mejorI0)]);
    disp(['angulo del modelo ' num2str(mejorang)]);
    disp(['posx ' num2str(mejorx)]);
    disp(['posy ' num2str(mejory)]);
    disp("--");
    
    abs(Zh - mediciones)
    
    figure
    hold on;
    grid on;
    view(60,30);
    colormap gray;
    surf(X,Y,Zh, 'EdgeColor', 'None');
    contour(X,Y,Zh);
    axis square;
    axis([-rangox rangox -rangoy rangoy 0 mx*1.1]);

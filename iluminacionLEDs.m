function [Zh] = iluminacionLEDs(altura, expansion, dispersion)

    % Iluminancia máxima de cada LED
    I0 = 18;

    % Rango del tablero
    rangox = 0.20;
    rangoy = 0.20;
    res    = 0.01;

    % Altura a la que se colocaran los LEDs respecto a la mesa
    zleds  = altura;

    puntos = [distribucionCircular(12, 0.022, altura, 0);
          distribucionCircular(16, 0.030, altura, 0);
          distribucionCircular(21, 0.038, altura, 0);];
          
    LEDpos = ordenarPuntos(puntos);
    %LEDpos = distribucionRectangular(7, 7, [-0.03 0.03], [-0.03 0.03], 0.7);
    LEDdes = ordenarPuntos(expansion*distribucionRectangularMod(7, 7, [-rangox rangox], [-rangoy rangoy], dispersion, 0));
    %LEDdes = ordenarPuntos(expansion*distribucionEspiral(36, 0.2, dispersion, 0));
    %LEDdes = ordenarPuntos(expansion*distribucionCircular(36, 0.2, 0, dispersion));

    x = -rangox:res:rangox;
    y = -rangoy:res:rangoy;
    grilla = zeros(length(x)*length(y),3);
    k = 1;
    Zh = zeros(length(x), length(y));
    
    vecLED  = LEDdes - LEDpos;
    vecLEDm = sqrt(sum(vecLED.^2,2));
    
    for i = 1:length(x)
        for j = 1:length(y)
            grilla(k,:) = [x(i) y(j) 0];
            k = k+1;
        end
    end
    
    s = size(LEDpos);
    for k = 1:s(1);
        dist = grilla(1:end, :) - repmat(LEDpos(k,:), length(grilla), 1);
        pint = vecLED(k,:)*dist';
        mods = vecLEDm(k) * sqrt(sum(dist.^2,2));
        ang  = pint./mods';
        angulo = real(acos(ang));
        lumh   = modeloLED(I0, 25*pi/180, angulo) .* cos(angulo).^3 / altura.^2;
        L = reshape(lumh, [length(x) length(y)]);
        Zh = Zh + L;
    end
function [media, rel] = iluminacionLEDsVec(altura, expansion, dispersion)

    % Iluminancia máxima de cada LED
    I0 = 18;

    % Rango del tablero
    rangox = 0.20;
    rangoy = 0.20;
    res    = 0.01;

    % Altura a la que se colocaran los LEDs respecto a la mesa
    zleds  = altura;

    LEDpos = distribucionCamara(zleds);
    LEDdes = expansion*distribucionRectangularMod(6, 6, [-rangox rangox], [-rangoy rangoy], dispersion, 0);

    vecLED = LEDdes - LEDpos;

    x = -rangox:res:rangox;
    y = -rangoy:res:rangoy;

    [X, Y] = meshgrid(x,y);
    Zh = zeros(size(X));
    
    s = size(LEDpos);
    for k = 1:s(1)
        

    for i= 1:length(x)
        for j= 1:length(y)
            s = size(LEDpos);
            for k = 1:s(1);
                pact   = [x(i) y(j) 0];
                vecP   = pact - LEDpos(k,:);
                angulo = real(acos(dot(vecLED(k,:), vecP)/((norm(vecLED(k,:))*norm(vecP)))));
                lumh   = (I0*(cos(angulo)).^11) / LEDpos(k,3).^2;
                Zh(j,i) = Zh(j,i) + lumh;
            end
        end
    end

    rel   = max(max(Zh))/min(min(Zh));
    media = mean(mean(Zh));
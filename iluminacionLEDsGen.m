function [r, mx, mn, emc, med, pesorel, pesomed] = iluminacionLEDsGen(LEDpos, LEDdes)

    % Parametros del LED: Iluminancia maxima y angulo medio
    I0 = 18;
    titaLED = 25*pi/180;

    % Rango del tablero
    rangox = 0.20;
    rangoy = 0.20;
    res    = 0.01;

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
        lumh   = modeloLED(I0, titaLED, angulo) .* cos(angulo).^3 / LEDpos(k,3).^2;
        L = reshape(lumh, [length(x) length(y)]);
        Zh = Zh + L;
    end
    
    [r, mx, mn, emc, med, pesorel, pesomed] = evaluarConfiguracion(Zh);
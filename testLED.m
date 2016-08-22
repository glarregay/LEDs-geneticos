function testLED(LP, LD)
    % Iluminancia m�xima de cada LED
    I0 = 63.81;

    % Rango del tablero
    rangox = 0.20;
    rangoy = 0.20;
    res    = 0.005;

    vecLED = LD - LP;
    vecLEDm = sqrt(sum(vecLED.^2,2));

    x = -rangox:res:rangox;
    y = -rangoy:res:rangoy;
    [X,Y] = meshgrid(x,y);
    grilla = zeros(length(x)*length(y),3);
    Zh = zeros(length(x), length(y));
    k=1;

    for i = 1:length(x)
        for j = 1:length(y)
            grilla(k,:) = [x(i) y(j) 0];
            k = k+1;
        end
    end

    s = size(LP);
    for k = 1:s(1);
        dist = grilla(1:end, :) - repmat(LP(k,:), length(grilla), 1);
        pint = vecLED(k,:)*dist';
        mods = vecLEDm(k) * sqrt(sum(dist.^2,2));
        ang  = pint./mods';
        angulo = real(acos(ang));
        lumh   = modeloLED(I0, 25*pi/180, angulo) .* cos(angulo).^3 / LP(k,3).^2;
        L = reshape(lumh, [length(x) length(y)]);
        Zh = Zh + L;
    end

    mx = max(max(Zh));
    mn = min(min(Zh));
    av = mean(mean(Zh));
    disp(['Media: ' num2str(av)]);
    disp(['M�ximo y m�nimo ' num2str(mx) ':' num2str(mn) ' (' num2str(abs(mn-mx)) ')']);
    disp(['Relacion ' num2str(mx/mn)]);

    figure
    plot3(LD(:,1), LD(:,2), LD(:,3), '+r');
    hold on;
    view(60,30);
    plot3(LP(:,1), LP(:,2), LP(1,3)*ones(length(LP(:,2))), '+r');
    for p = 1:length(LP)
        plot3([LP(p,1) LD(p,1)], [LP(p,2) LD(p,2)], [LP(p,3) LD(p,3)], 'Color', [0.75 0.75 0.75]);
    end
    fill([-.2 -.2 .2 .2],[.2 -.2 -.2 .2],[0.4 0.4 0.4]);
    axis equal;
    grid on
    axis(2*[-rangox rangox -rangoy rangoy]);
    
    figure
    hold on;
    grid on;
    view(60,30);
    colormap gray;
    surf(X,Y,Zh, 'EdgeColor', 'None');
    contour(X,Y,Zh);
    axis square;
    axis([-rangox rangox -rangoy rangoy 0 mx*1.1]);

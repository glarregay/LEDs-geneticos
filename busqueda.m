% Buscar la minima relacion entre ciertos valores
clear;

n = 25;
m = 25;
k = 1;

altura    = 0.66;
rangoexp  = linspace(1, 1.2, n);
rangodisp = linspace(0, 7, m);

mejores = zeros(m, n);
mx = zeros(m,n);
mn = zeros(m,n);
med = zeros(m,n);

for i = 1:n
    for j = 1:m
        zh = iluminacionLEDs(altura, rangoexp(i), rangodisp(j));
        [mejores(j,i), mx(j,i), mn(j,i), ~, med(j,i), ~, ~] = evaluarConfiguracion(zh);
        disp(['Iteración ' num2str(k) ' de ' num2str(n*m)]);
        k = k+1;
    end
end


[X, Y] = meshgrid(rangoexp, rangodisp);

indice = mejores == min(min(mejores));

figure
colormap gray;
surf(X,Y,mejores, 'EdgeColor', 'None');
axis square;

disp(['Expansión óptima:    ' num2str(X(indice))]);
disp(['Dispersión óptima:   ' num2str(Y(indice))]);
disp(['Iluminación media:   ' num2str(med(indice)) ' lux.']);
disp(['Rel. de iluminación :' num2str(mx(indice)/mn(indice)) ' (' num2str(mx(indice)-mn(indice)) ' lux)']);

LD = ordenarPuntos(X(indice)*distribucionRectangularMod(7, 7, [-.2 .2], [-.2 .2], Y(indice), 0));

puntos = [distribucionCircular(12, 0.022, altura, 0);
          distribucionCircular(16, 0.030, altura, 0);
          distribucionCircular(21, 0.038, altura, 0);];
          
LEDpos = ordenarPuntos(puntos);
    
testLED(LEDpos, LD);

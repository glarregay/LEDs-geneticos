altura = 0.66;

puntos = [distribucionCircular( 8, 0.022, altura, 0);
          distribucionCircular(12, 0.030, altura, 0);
          distribucionCircular(16, 0.038, altura, 0);];
          
LP = ordenarPuntos(puntos);

plot(puntos(:,1), puntos(:,2), '+k');
axis([-0.05 0.05 -0.05 0.05]);
axis equal;
hold on;
plot(0.045*cos(0:0.01:2*pi), 0.045*sin(0:0.01:2*pi), 'k', 'LineWidth', 2);
plot(0.0145*cos(0:0.01:2*pi), 0.0145*sin(0:0.01:2*pi), 'k', 'LineWidth', 2);
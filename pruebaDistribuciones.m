ejex = [-0.2 0.2];
ejey = [-0.2 0.2];

puntos = distribucionRectangularMod(6, 6, ejex, ejey, 8, 0);

plot(puntos(:,1), puntos(:,2), 'o');
axis equal;
axis([ejex ejey]);

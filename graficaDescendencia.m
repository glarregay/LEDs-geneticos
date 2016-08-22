E1 = ordenarPuntos(distribucionCircular(10, 0.08, 0, 0));
E2 = ordenarPuntos(distribucionCircular(10, 0.25, 0, 0.05));

p1 = evaluarConfiguracion(E1);
p2 = evaluarConfiguracion(E2);

E3 = combinarEspecimenes(E1, E2, p1, p2);
p3 = evaluarConfiguracion(E3);

f1 = 1-(p2/(p1+p2));
f2 = 1-(p1/(p1+p2));
E3p = f1*E1 + f2*E2;

figure;
subplot(2,4,2);
hold on;
grid on;
axis([-.4 .4 -.4 .4]);
axis square;
plot(E1(:,1), E1(:,2), '+r', 'LineWidth', 2);

subplot(2,4,3);
hold on;
grid on;
axis([-.4 .4 -.4 .4]);
axis square;
plot(E2(:,1), E2(:,2), '+b', 'LineWidth', 2);

subplot(2,4,6);
hold on;
grid on;
axis([-.4 .4 -.4 .4]);
axis square;
plot(E1(:,1), E1(:,2), '+r', 'LineWidth', 2);
plot(E2(:,1), E2(:,2), '+b', 'LineWidth', 2);
plot(E3p(:,1), E3p(:,2), 'ok', 'LineWidth', 2);

subplot(2,4,7);
hold on;
grid on;
axis([-.4 .4 -.4 .4]);
axis square;
plot(E1(:,1), E1(:,2), '+r', 'LineWidth', 2);
plot(E2(:,1), E2(:,2), '+b', 'LineWidth', 2);
plot(E3(:,1), E3(:,2), 'ok', 'LineWidth', 2);
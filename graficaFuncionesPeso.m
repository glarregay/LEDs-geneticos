x = 0:0.5:500;
prel = 55;
pmed = 380;

yrel = 0.5*(1+tanh((x-200)/150));
ymed = 1-0.5*(1+tanh((x-150)/150));

relp = 0.5*(1+tanh((prel-200)/150));
medp = 1-0.5*(1+tanh((pmed-150)/150));

figure
subplot(2,1,1);
plot(x, yrel, 'Color', 'r', 'LineWidth', 2);
title('Evaluación del error medio cuadrático');
xlabel('EMC');
ylabel('Peso');

subplot(2,1,2);
plot(x, ymed, 'Color', 'b', 'LineWidth', 2);
title('Evaluación de la iluminación media');
xlabel('Iluminación media');
ylabel('Peso');

figure
subplot(2,1,1);
hold on;
plot(x, yrel, 'Color', 'r', 'LineWidth', 2);
plot([prel prel], [0 relp], 'k--');
plot(prel, relp, 'o', 'Color', 'r', 'LineWidth', 2);
text(prel, relp+0.1, num2str(relp), 'HorizontalAlignment', 'Center');
title('Evaluación del error medio cuadrático');
xlabel('EMC');
ylabel('Peso');

subplot(2,1,2);
hold on;
plot(x, ymed, 'Color', 'b', 'LineWidth', 2);
plot([pmed pmed], [0 medp], 'k--');
plot(pmed, medp, 'o','Color', 'b', 'LineWidth', 2);
text(pmed, medp+0.1, num2str(medp), 'HorizontalAlignment', 'Center');
title('Evaluación de la iluminación media');
xlabel('Iluminación media');
ylabel('Peso');
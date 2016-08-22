tita = -pi/2:0.01:pi/2;
r25 = (cos(tita)).^7.0459;
r30 = (cos(tita)).^4.8188;
r60 = (cos(tita)).^1;

[x25, y25] = pol2cart(tita-pi/2, r25);
[x30, y30] = pol2cart(tita-pi/2, r30);
[x60, y60] = pol2cart(tita-pi/2, r60);

rangot = 0:-0.005:-pi;
[xc25p, yc25p] = pol2cart(rangot, 0.25*ones(size(rangot,1)));
[xc50p, yc50p] = pol2cart(rangot, 0.5*ones(size(rangot,1)));
[xc75p, yc75p] = pol2cart(rangot, 0.75*ones(size(rangot,1)));
[xc100p, yc100p] = pol2cart(rangot, ones(size(rangot,1)));

figure; hold on;
axis([-1.1 1.1 -1 0]);
axis equal;
plot(xc25p, yc25p, 'k--');
plot(xc50p, yc50p, 'k');
plot(xc75p, yc75p, 'k--');
plot(xc100p, yc100p, 'k');
plot([0 0],[0 -1], 'k');
plot([-1 1],[0 0], 'k');
plot([0 cosd(-115)],[0 sind(-115)], 'k');
plot([0 cosd(-65)],[0 sind(-65)], 'k');
plot([0 cosd(-120)],[0 sind(-120)], 'k');
plot([0 cosd(-60)],[0 sind(-60)], 'k');
plot([0 cosd(-150)],[0 sind(-150)], 'k');
plot([0 cosd(-30)],[0 sind(-30)], 'k');

text(1.08*cosd(-65),1.08*sind(-65), '25º', 'HorizontalAlignment', 'center');
text(1.08*cosd(-60),1.08*sind(-60), '30º', 'HorizontalAlignment', 'center');
text(1.08*cosd(-30),1.08*sind(-30), '60º', 'HorizontalAlignment', 'center');
text(0, -1.08, '0º', 'HorizontalAlignment', 'center');
text(1.08*cosd(-115),1.08*sind(-115), '-25º', 'HorizontalAlignment', 'center');
text(1.08*cosd(-120),1.08*sind(-120), '-30º', 'HorizontalAlignment', 'center');
text(1.08*cosd(-150),1.08*sind(-150), '-60º', 'HorizontalAlignment', 'center');

text(0.25,0.08, '25%', 'HorizontalAlignment', 'center');
text(0.5,0.08, '50%', 'HorizontalAlignment', 'center');
text(0.75,0.08, '75%', 'HorizontalAlignment', 'center');

plot(x25, y25, 'r', 'LineWidth', 2);
plot(x30, y30, 'g', 'LineWidth', 2);
plot(x60, y60, 'b', 'LineWidth', 2);
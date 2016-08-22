dr = distribucionRectangularMod(6, 6, [-0.2 0.2], [-0.2 0.2], 0, 0);
subplot(2,4,2)
plot(dr(:,1), dr(:,2), '+r');
axis([-0.4 0.4 -0.4 0.4]);
axis square;
title('exp = 1, disp = 0');

dr = distribucionRectangularMod(6, 6, [-0.2 0.2], [-0.2 0.2], 2, 0);
subplot(2,4,3)
plot(dr(:,1), dr(:,2), '+r');
axis([-0.4 0.4 -0.4 0.4]);
axis square;
title('exp = 1, disp = 2');

dr = 1.7*distribucionRectangularMod(6, 6, [-0.2 0.2], [-0.2 0.2], 0, 0);
subplot(2,4,6)
plot(dr(:,1), dr(:,2), '+r');
axis([-0.4 0.4 -0.4 0.4]);
axis square;
title('exp = 1.7, disp = 0');

dr = 1.7*distribucionRectangularMod(6, 6, [-0.2 0.2], [-0.2 0.2], 2, 0);
subplot(2,4,7)
plot(dr(:,1), dr(:,2), '+r');
axis([-0.4 0.4 -0.4 0.4]);
axis square;
title('exp = 1.7, disp = 2');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dr = distribucionEspiral(36, 0.2, 1, 0);
subplot(2,4,2)
plot(dr(:,1), dr(:,2), '+r');
axis([-0.4 0.4 -0.4 0.4]);
axis square;
title('exp = 1, atr = 1');

dr = distribucionEspiral(36, 0.2, 0.5, 0);
subplot(2,4,3)
plot(dr(:,1), dr(:,2), '+r');
axis([-0.4 0.4 -0.4 0.4]);
axis square;
title('exp = 1, atr = 0.5');

dr = 1.7*distribucionEspiral(36, 0.2, 1, 0);
subplot(2,4,6)
plot(dr(:,1), dr(:,2), '+r');
axis([-0.4 0.4 -0.4 0.4]);
axis square;
title('exp = 1.7, atr = 1');

dr = 1.7*distribucionEspiral(36, 0.2, 0.5, 0);
subplot(2,4,7)
plot(dr(:,1), dr(:,2), '+r');
axis([-0.4 0.4 -0.4 0.4]);
axis square;
title('exp = 1.7, atr = 0.5');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dr = distribucionCircular(36, 0.2, 0, 0);
subplot(2,4,2)
plot(dr(:,1), dr(:,2), '+r');
axis([-0.4 0.4 -0.4 0.4]);
axis square;
title('exp = 1, disp = 0');

dr = distribucionCircular(36, 0.2, 0, 0.05);
subplot(2,4,3)
plot(dr(:,1), dr(:,2), '+r');
axis([-0.4 0.4 -0.4 0.4]);
axis square;
title('exp = 1, disp = 0.05');

dr = 1.3*distribucionCircular(36, 0.2, 0, 0);
subplot(2,4,6)
plot(dr(:,1), dr(:,2), '+r');
axis([-0.4 0.4 -0.4 0.4]);
axis square;
title('exp = 1.3, disp = 0');

dr = 1.3*distribucionCircular(36, 0.2, 0, 0.05);
subplot(2,4,7)
plot(dr(:,1), dr(:,2), '+r');
axis([-0.4 0.4 -0.4 0.4]);
axis square;
title('exp = 1.3, disp = 0.05');
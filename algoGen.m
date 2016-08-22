

altura = 0.66;
gens = 10;

%LP = distribucionCamara(altura);
puntos = [distribucionCircular(12, 0.022, altura, 0);
          distribucionCircular(16, 0.030, altura, 0);
          distribucionCircular(21, 0.038, altura, 0);];
          
LP = ordenarPuntos(puntos);

% Poblaciones iniciales
 %P{1} = ordenarPuntos(3.8*distribucionEspiral(36, 0.2, 0.912, 0));
 %P{2} = ordenarPuntos(3.1*distribucionEspiral(36, 0.2, 0.94502, 0));
  P{1} = ordenarPuntos(distribucionRectangularMod(7, 7, [-.2 .2], [-.2 .2], 0, 0));
  P{2} = ordenarPuntos(0.4*distribucionRectangularMod(7, 7, [-.2 .2], [-.2 .2], 0, 0));
  P{3} = ordenarPuntos(0.8*distribucionRectangularMod(7, 7, [-.2 .2], [-.2 .2], 0.25, 0));
  P{4} = ordenarPuntos(distribucionRectangularMod(7, 7, [-.2 .2], [-.2 .2], 0.5, 0));
  P{5} = ordenarPuntos(1.583*distribucionRectangularMod(7, 7, [-.2 .2], [-.2 .2], 3, 0));
  P{6} = ordenarPuntos(0.7*distribucionRectangularMod(7, 7, [-.2 .2], [-.2 .2], 0.875, 0));
%  P{6} = (1.2857*distribucionRectangularMod(6, 6, [-0.2 0.2], [-0.2 0.2],1.2558, 0));
%  P{7} = (1.4333*distribucionRectangularMod(6, 6, [-0.2 0.2], [-0.2 0.2],1.3888, 0));
%  P{8} = (1.2857*distribucionRectangularMod(6, 6, [-0.2 0.2], [-0.2 0.2],1.555, 0));
%  P{9} = (1.002*distribucionRectangularMod(6, 6, [-0.2 0.2], [-0.2 0.2],2, 0));
%  P{10}= (1.005*distribucionRectangularMod(6, 6, [-0.2 0.2], [-0.2 0.2],2.225, 0));
%  P{1} = ordenarPuntos(2*distribucionEspiral(36, 0.35, 1.1111, 0));
%  P{2} = ordenarPuntos(1.1*distribucionEspiral(36, 0.3, 0.88889, 0));
%  P{3} = ordenarPuntos(1.1*distribucionRectangularMod(6, 6, [-0.2 0.2], [-0.2 0.2],1.474, 0));
%  P{4} = ordenarPuntos(1.5*distribucionRectangularMod(6, 6, [-0.2 0.2], [-0.2 0.2],1.8, 0));
%  P{5} = ordenarPuntos(1.3*distribucionRectangularMod(6, 6, [-0.2 0.2], [-0.2 0.2],1.5, 0));
%  P{6} = ordenarPuntos(1.2857*distribucionRectangularMod(6, 6, [-0.2 0.2], [-0.2 0.2],1.2558, 0));
%  P{7} = ordenarPuntos(1.4333*distribucionRectangularMod(6, 6, [-0.2 0.2], [-0.2 0.2],1.3888, 0));
%  P{8} = ordenarPuntos(1.2857*distribucionRectangularMod(6, 6, [-0.2 0.2], [-0.2 0.2],1.555, 0));
%  P{9} = ordenarPuntos(1.002*distribucionRectangularMod(6, 6, [-0.2 0.2], [-0.2 0.2],2, 0));
%  P{10}= ordenarPuntos(1.005*distribucionRectangularMod(6, 6, [-0.2 0.2], [-0.2 0.2],2.225, 0));
% P{1} = ordenarPuntos([0.5-rand(36,2) zeros(36,1)]*0.4);
%P{2} = ordenarPuntos([0.5-rand(36,2) zeros(36,1)]*0.41);
%P{1} = ordenarPuntos([0.5-rand(49,2) zeros(49,1)]*0.3);
%P{2} = ordenarPuntos([0.5-rand(49,2) zeros(49,1)]*0.29);
%P{3} = ordenarPuntos([0.5-rand(49,2) zeros(49,1)]*0.28);
%P{4} = ordenarPuntos([0.5-rand(49,2) zeros(49,1)]*0.31);
%P{5} = ordenarPuntos([0.5-rand(49,2) zeros(49,1)]*0.32);
%P{6} = ordenarPuntos([0.5-rand(49,2) zeros(49,1)]*0.3);
P{7} = ordenarPuntos([0.5-rand(49,2) zeros(49,1)]*0.29);
P{8} = ordenarPuntos([0.5-rand(49,2) zeros(49,1)]*0.28);
P{9} = ordenarPuntos([0.5-rand(49,2) zeros(49,1)]*0.31);
P{10} = ordenarPuntos([0.5-rand(49,2) zeros(49,1)]*0.32);

% minrg = 0.95;
% maxrg = 1.05;
% mtrand1 = [(maxrg-minrg)*rand(length(P{1}),2) + minrg, zeros(length(P{1}),1)];
% mtrand2 = [(maxrg-minrg)*rand(length(P{1}),2) + minrg, zeros(length(P{1}),1)];
% mtrand3 = [(maxrg-minrg)*rand(length(P{1}),2) + minrg, zeros(length(P{1}),1)];
% mtrand4 = [(maxrg-minrg)*rand(length(P{1}),2) + minrg, zeros(length(P{1}),1)];
% 
% P{7} = ordenarPuntos(P{1} .* mtrand1);
% P{8} = ordenarPuntos(P{2} .* mtrand2);
% P{9} = ordenarPuntos(P{3} .* mtrand3);
% P{10} = ordenarPuntos(P{4} .* mtrand4);

%P = OLDP;
 
param = zeros(1,length(P));

histindmed = zeros(gens, 1);
histindmin = zeros(gens, 1);
vargraf = zeros(gens, 6);

for i = 1:length(P)
    param(i) = iluminacionLEDsGen(LP, P{i});
end 

for i = 1:gens
    Po = nuevaGeneracion(P, param);
    
    [P, param, mx, mn, emc, med, pesorel, pesomed] = buscarMejores([P, Po], LP);
    
    histindmin(i) = param(1);
    histindmed(i) = mean(param);
    vargraf(i, :) = [mx(1) mn(1) emc(1) med(1) pesorel(1) pesomed(1)];
    
    disp(['Generacion ' num2str(i) ':   Mejor: ' num2str(histindmin(i)) '   Media: ' num2str(histindmed(i))]);
    
end 

testLED(LP, P{1});
figure;
subplot(3,1,1);
plot(1:gens, vargraf(:,1), 'r', 1:gens, vargraf(:,2), 'b', 1:gens, vargraf(:,4), 'k-');
title('Maximo/minimo/media');
subplot(3,1,2);
plot(1:gens, vargraf(:,3));
title('EMC');
subplot(3,1,3);
plot(1:gens, vargraf(:,5), 'r', 1:gens, vargraf(:,6), 'b');
title('Pesos');
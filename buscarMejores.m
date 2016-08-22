function [P, par, mx, mn, emc, med, pesorel, pesomed] = buscarMejores(Pi, ref)

    param = zeros(1, length(Pi));
    mx = zeros(1, length(Pi));
    mn = zeros(1, length(Pi));
    emc = zeros(1, length(Pi));
    med = zeros(1, length(Pi));
    pesorel = zeros(1, length(Pi));
    pesomed = zeros(1, length(Pi));
    
    for i = 1:length(Pi)
        [param(i), mx(i), mn(i), emc(i), med(i), pesorel(i), pesomed(i)] = iluminacionLEDsGen(ref, Pi{i});
    end
    
    [~, o] = sort(param);
    
    o = o(1:10);
    
    P = Pi(o);
    par = param(o);
    mx = mx(o);
    mn = mn(o);
    emc = emc(o);
    med = med(o);
    pesorel = pesorel(o);
    pesomed = pesomed(o);
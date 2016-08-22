function [r, mx, mn, emc, med, pesorel, pesomed] = evaluarConfiguracion(z)

    mx = max(max(z));
    mn = min(min(z));
    med = mean(mean(z));
    rel = mx/mn;
    err = z-med;
    emc = sqrt(sum(sum(err.^2, 1)));
%     z = z-med;    
    %r = sqrt(sum(sum(z.^2, 1)))*(maxi/mini).^2;
    %r = (maxi/mini);
    
    %pesorel = 0.5*(1+tanh(((maxi/mini)-1.25)/0.25));
    %pesorel = (1000-med)*((maxi/mini) -1).^2;
    pesorel = 1-1/cosh(10*(rel-1));
    %pesorel = 2*asec(2*(rel-0.5))/pi;
    %pesorel = 0.5*(1+tanh((emc-200)/75));
    %pesorel = 2*asec((emc/250)+1)/pi;
    
    %pesorel = 0.5*(1+tanh((emc-200)/150));
    %pesorel = 2*asec(2*(rel-0.5))/pi;
    
    %pesomed = 1-0.5*(1+tanh((med-250)/100));
    %pesomed = (500-med)*(1-0.5*(1+tanh((med-250)/100)));
    pesomed = 1-0.5*(1+tanh((med-350)/120));
    %pesomed = 0.5*(1+tanh((emc-200)/75));
    
    r = (pesorel+pesomed)/2;
    
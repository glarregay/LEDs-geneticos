function [a] = ordenarPuntos(matriz) 

    % Ordenación polar
    [t, r] = cart2pol(matriz(:,1), matriz(:,2));
    
    [~, vo] = sort(1000000*t+r/max(r));
    
    a = matriz(vo,:);
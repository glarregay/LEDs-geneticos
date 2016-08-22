function res = combinarEspecimenes(E1, E2, p1, p2)

    %suma  = (p2/p1).*E1 + (p1/p2).*E2;
    %suma = [E1(1:2:end, :); E2(2:2:end,:)];
    %aleat = [rand(length(suma),2) zeros(length(suma),1)].*0.04;
    %res = ordenarPuntos(suma .* 0.5 + aleat);
    
    f1 = 1-(p2/(p1+p2));
    f2 = 1-(p1/(p1+p2));
    
    minl = -0.01;
    maxl = 0.01;
    
    rmut = rand();
   
    if(rmut > 0.95) 
        minl = -0.025;
        maxl = 0.025;
    end
    
    sumapond = f1*E1 + f2*E2;
    aleatorio = [(maxl-minl)*rand(length(E1),2) + minl, zeros(length(E1),1)];
    
    if(rand() > 0.95)
        res = ordenarPuntos(((0.2)*rand() + 0.9)*(sumapond + aleatorio));
    else
        res = ordenarPuntos(sumapond + aleatorio);
    end
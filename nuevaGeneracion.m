function Po = nuevaGeneracion(Pi, param)

    Po = cell(1, length(Pi)*length(Pi));
    k = 1;

    for i = 1:length(Pi)
        for j = 1:length(Pi)
            
            Po{k} = combinarEspecimenes(Pi{i}, Pi{j}, param(i), param(j));
            k = k + 1;
            
        end
    end
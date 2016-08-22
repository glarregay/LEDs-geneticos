function generarSCAD(posicionLEDs, destinoLEDs)
    % Calculo de los puntos para generar los cilindros que hacen los agujeros
    % del cubo

    vecLED = destinoLEDs - posicionLEDs;

    disp('a = [');
    for i = 1:length(vecLED)
        disp(['[' num2str(1000*posicionLEDs(i,1)) ', ' num2str(1000*posicionLEDs(i,2)) ', 0],']);
    end
    disp('];');
    disp(' ');
    disp('b = [');
    for i = 1:length(vecLED)
        vecLED(i,:) = vecLED(i,:) ./ norm(vecLED(i,:));
        disp(['[' num2str(vecLED(i,1)) ', ' num2str(vecLED(i,2)) ', ' num2str(vecLED(i,3)) '],']);
    end
    disp('];');
    
% Codigo viejo
%         n = norm(vecLED(i, :));
%         dir = vecLED(i,:)/n;
% 
%         infe = 1000 * ([posicionLEDs(i,1:2) 0] + 0.02*dir);
%         supe = 1000 * ([posicionLEDs(i,1:2) 0] - 0.02*dir);
% 
%         disp(['cilindro([' num2str(infe(1)) ',' num2str(infe(2)) ',' num2str(infe(3)) '],[' num2str(supe(1)) ',' num2str(supe(2)) ',' num2str(supe(3)) '],2.55);']);



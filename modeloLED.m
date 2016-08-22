function lum = modeloLED(imax, tita, angulos)

    %m = abs(log(2)./log(cos(tita)));
    m = 99.151; % Para 25�
    lum = imax.*real(cos(angulos).^m);
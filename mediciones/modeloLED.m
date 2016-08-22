function lum = modeloLED(imax, tita, angulos)

    m = abs(log(2)./log(cos(tita)));
    %m = 9.1682; % Para 25º
    lum = imax.*real(cos(angulos).^m);

function pos = distribucionCircular(n, radio, altura, disp)

    pos = zeros(n, 3);
    pos(:,3) = altura*ones(n,1);
    
    for i=1:n
        xy = [(radio+ disp*(-1)^i)*(cos(i/n * 2*pi)), (radio+ disp*(-1)^i)*(sin(i/n * 2*pi))];
        pos(i, 1:2) = xy;
    end
        
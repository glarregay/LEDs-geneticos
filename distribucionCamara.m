function pos = distribucionCamara(altura)

    pos = zeros(36, 3);
    pos(:,3) = altura*ones(36,1);
    
    P = 1.2 * ...
        [ -0.025  -0.025;
          -0.025  -0.015;
          -0.025  -0.005;
          -0.025   0.005;
          -0.025   0.015;
          -0.025   0.025;
          -0.015  -0.025;
          -0.020  -0.020;
          -0.020  -0.010;
          -0.020   0.010;
          -0.020   0.020;
          -0.015   0.025;
          -0.005  -0.025;
          -0.010  -0.020;
          -0.015  -0.015;
          -0.015   0.015;
          -0.010   0.020;
          -0.005   0.025;
           0.005  -0.025;
           0.010  -0.020;
           0.015  -0.015;
           0.015   0.015;
           0.010   0.020;
           0.005   0.025;           
           0.015  -0.025;
           0.020  -0.020;
           0.020  -0.010;
           0.020   0.010;
           0.020   0.020;
           0.015   0.025;
           0.025  -0.025;
           0.025  -0.015;
           0.025  -0.005;
           0.025   0.005;
           0.025   0.015;
           0.025   0.025;];
       
%    P = ...
%   [-0.0500   -0.0500
%    -0.0500   -0.0400
%    -0.0500   -0.0150
%    -0.0500    0.0150
%    -0.0500    0.0400
%    -0.0500    0.0500
%    -0.0400   -0.0500
%    -0.0400   -0.0400
%    -0.0400   -0.0150
%    -0.0400    0.0150
%    -0.0400    0.0400
%    -0.0400    0.0500
%    -0.0150   -0.0500
%    -0.0150   -0.0400
%    -0.0250   -0.0250
%    -0.0250    0.0250
%    -0.0150    0.0400
%    -0.0150    0.0500
%     0.0150   -0.0500
%     0.0150   -0.0400
%     0.0250   -0.0250
%     0.0250    0.0250
%     0.0150    0.0400
%     0.0150    0.0500
%     0.0400   -0.0500
%     0.0400   -0.0400
%     0.0400   -0.0150
%     0.0400    0.0150
%     0.0400    0.0400
%     0.0400    0.0500
%     0.0500   -0.0500
%     0.0500   -0.0400
%     0.0500   -0.0150
%     0.0500    0.0150
%     0.0500    0.0400
%     0.0500    0.0500];

    pos(1:end, 1:2) = P;
        
close all
clear all
f = 2;
w = 2 * pi * f;
alpha = 5;
A = 1;
rm = 50;
r = 1:3:rm;
th = linspace(0, 2 * pi, 30);
[R, TH] = meshgrid(r, th);
[X, Y] = pol2cart(TH, R);
U = A * cos(w * (-R / alpha))./ R;
figure
h = surf(X, Y, U);
axis([-rm, rm, -rm, rm, -1, 1])
box on
fs = 16;
title('The surface of spherical wave propagation', 'FontSize', fs)
xlabel('\itx\rm / km', 'FontSize',fs);
ylabel('\ity\rm / km', 'FontSize',fs);
zlabel('\itu', 'FontSize',fs);
hold on
t = 0;
while 1    %it's a infinity loop!!!press Esc to break
    if get(gcf, 'CurrentCharacter') == char(27)
        break
    end
    t = t + 0.01;
    U = A * cos(w * (t - R/alpha))./ R;
    set(h, 'ZData', U)
    drawnow
    pause(0.02)
end

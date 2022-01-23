clear all
close all
T = 0.5;
c = 3;
lamada = c*T;
t= [0:0.05:2 * T]/T;
x= [0:0.01:3 * lamada]/lamada;
[X1, T1] = meshgrid(x,t);
a = 0.2;
U = a * cos(2 * pi/T * (T1 - X1/c));
figure(1)
waterfall(X1,T1,U)
alpha(0,1)
box on
axis equal
fs = 16;
title('spatio-temporal distribution simulation of fluctuation ', 'FontSize', fs)
xlabel('\itx/\lambda', 'FontSize', fs)
ylabel('\itt/\T', 'FontSize', fs)
zlabel('\itu', 'FontSize', fs)
i = floor(rand * length(x)) + 1;
x0 = 1;
u1 = a * cos(2 * pi * (t - x0));
hold on
plot3(ones(size(t)) * x0, t, u1, 'LineWidth', 2)
t0 = 1;
u2 = a * cos(2 * pi * (t0 - x));
plot3(x, ones(size(x)) * t0, u2, 'r', 'LineWidth', 2)

figure(2)
subplot(2, 1, 1)
plot(t, u1, 'LineWidth', 2)
grid on
title(['\itx\rm_0 = ', num2str(x0), 'particle vibration curve of \it\Lambda '], 'FontSize', fs)
xlabel('\itt/T', 'FontSize', fs)
ylabel('\itu', 'FontSize', fs)
subplot(2,1,2)
plot(x, u2, 'LineWidth', 2)
grid on
title(['\itt\rm_0 = ', num2str(t0), 'wave graph at \itT '], 'FontSize', fs)
xlabel('\itx/\Lambda', "FontSize", fs)
ylabel('\itu', 'FontSize', fs)
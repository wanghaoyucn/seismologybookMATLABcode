close all
x = 0:0.01:8 * pi;
N = length(x);
y = sin(x);
z = cos(x);
xx = [];
for ii = 1:N
    xx = [xx; x(ii), z(ii), 0; x(ii), 0, 0];
end
plot3(xx(:,1), xx(:,2), xx(:,3), 'g');
hold on
fill3([x,0], [zeros(size(x)),0], [y,y(1)], 'y');
text(x(N),z(N), 0, 'SH-wave', 'FontSize', 14)
text(20,0,1.1, 'SV-wave', 'FontSize', 14)
view(22,26)
xlabel('along the direction of the wave propagation', 'Rotation', -5, 'FontSize', 16)
grid on
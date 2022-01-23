clc
clear
Nx = 201; Nz = 201; Nt = 400;
h = 8;
dt = 0.001;
c = 3000;
f = 20;
gamma = 3;
A = (dt * c)^2 / h^2;
u = zeros(Nx, Nz, Nt);
for k = 2:Nt-1
    for i = 3:Nx-2
        for j = 3:Nz-2
            if i == 100 & j == 100
                u(i, j, k+1) = exp(-(2 * pi * f * k * dt/gamma).^2).* cos(2 * pi * f * k * dt);
            else
                u(i, j, k+1) = A * (u(i+1, j, k) + u(i-1, j, k) + u(i, j+1, k) + u(i, j-1, k) - 4 * u(i, j, k)) - u(i, j, k-1) + 2 * u(i, j, k);
            end
            u(3, j, k+1) = u(4, j, k+1);
        end
    end
end
filename = '2D_wave_field_snapshot.gif';
for k = 1:1:400
    pcolor(u(:,:,k))
    shading interp;
    colormap('bone');
    axis equal
    axis([0, 200, 0, 200]);
    set(gca, 'Ydir', 'reverse');
    xlabel('x');
    ylabel('z');
    title('顶部为自由边界条件，其他为透射边界的二维声波传播快照');
    % set(gcf, 'doublebuffer', 'on'); % eliminate the vibration
    f = getframe(gcf);
    imind = frame2im(f);
    [imind, cm] = rgb2ind(imind, 256);
    if k == 1
        imwrite(imind, cm, filename, 'gif', 'Loopcount', inf, 'DelayTime', 0.05);
    else
        imwrite(imind, cm, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 0.1);
    end
end

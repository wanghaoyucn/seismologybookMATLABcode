c = 3.0; f = 0.5;
omega = 2 * pi * f;
k = omega / c;
N = 100;
cmap = colormap('jet');
M = moviein(N);
filename = 'SH_simu.gif'
for ii = 1:N
    t = (ii - 1) * 0.1;
    hold off
    for z = 0:3:30
        cor = [];
        for x = 0:0.5:20
            y = sin(omega * t - k * x);
            cor = [cor; x, y, z];
        end
        Ind = ceil(z/30 * 64);
        if(Ind == 0)
            Ind = 1;
        end
        plot3(cor(:,1), cor(:,2), cor(:,3), '.-', 'Color', cmap(Ind, :))
        hold on
    end
    set(gca, 'Zdir', 'reverse')
    grid on
    axis([-1, 21, -1, 1, 0, 30]);
    view(30, 75);
    xlabel('along the direction of the SH-wave propagation / km', 'Rotation', -20);
    ylabel('along the direction of vibration / km', 'Rotation', 45);
    zlabel('depth / km');
    M(:, ii) = getframe(gcf);
    imind = frame2im(M(:, ii));
    [imind, cm] = rgb2ind(imind, 256);
    if ii == 1
        imwrite(imind, cm, filename, 'gif', 'Loopcount',  inf, 'DelayTime', 0.05);
    else
        imwrite(imind, cm, filename, 'gif', 'WriteMode',  'append', 'DelayTime', 0.1);
    end
end
movie(M)

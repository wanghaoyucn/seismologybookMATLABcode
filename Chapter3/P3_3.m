c = 5.0; f = 3;
omega = 2 * pi * f;
k = omega / c;
N = 100;
cmap = colormap('jet');
M = moviein(N);
filename = 'P_simu.gif';
for ii = 1:N
    t = (ii - 1) * 0.02;
    hold off
    x= 0:0.1:6;
    u = 0.1 * cos(omega * t - k * x);
    for z = 0:3:30
        Ind = ceil(z/30 * 64);
        if(Ind == 0)
            Ind = 1;
        end
        plot(x + u, z, '.', 'Color', cmap(Ind, :))
        hold on
    end
    set(gca, 'Ydir', 'reverse')
    axis([-0.1, 6, 0, 30]);
    xlabel('direction of P-wave / km');
    ylabel('depth / km');
    M(:,ii) = getframe(gcf);
    imind = frame2im(M(:,ii));
    [imind, cm] = rgb2ind(imind, 256)
    if ii == 1
        imwrite(imind, cm, filename, 'gif', 'Loopcount', inf, 'DelayTime', 0.05);
    else
        imwrite(imind, cm, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 0.1);
    end
end

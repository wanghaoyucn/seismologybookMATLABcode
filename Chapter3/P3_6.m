c = 3.5; f = 1;
omega = 2 * pi * f;
k = omega / c;
N = 100;
cmap = colormap('jet');
M = moviein(N);
filename = 'SV_simu.gif'
for ii = 1:N
    t = (ii - 1) * 0.1;
    x = 0:0.2:10;
    hold off
    for z = 0:3:30
        uz = cos(omega *t - k * x);
        Ind = ceil(z / 30 * 64);
        if(Ind  == 0)
            Ind = 1;
        end
        plot(x, z + uz,'.-', 'Color', cmap(Ind, :))
        hold on
    end
    set(gca, 'Ydir', 'reverse')
    axis([0, 10, -1, 31]);
    xlabel('along the direction of SV-wave / km');
    ylabel('depth / km');
    M(:, ii) = getframe(gcf);
    imind = frame2im(M(:, ii));
    [imind, cm] = rgb2ind(imind, 256);
    if ii == 1
        imwrite(imind, cm, filename, 'gif', 'Loopcount', inf, 'DelayTime', 0.05);
    else
        imwrite(imind, cm, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 0.1);
    end
end
movie(M)
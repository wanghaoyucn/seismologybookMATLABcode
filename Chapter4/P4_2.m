%P4_2.m
alpha = 5; beta = 3;
beta2 = beta * beta;
alpha2 = alpha * alpha;
is0 = rad2deg(asin(beta / alpha));
is = 0:is0;
ip = rad2deg(asin(alpha / beta * sin(deg2rad(is))));
den = beta2 * sin(deg2rad(2 * ip)) .* sin(deg2rad(2 * is)) + alpha2 * cos(deg2rad(2 * is)) .^ 2;
BA = beta2 * sin(deg2rad(2 * ip)) .* sin(deg2rad(2 * is)) - alpha2 * cos(deg2rad(2 * is)) .^ 2 ./ den;
CA = -2 * alpha2 * sin(deg2rad(2 * ip)) .* cos(deg2rad(2 * is)) ./ den;
plot(is, BA, 'k:', is, CA, 'k--')
legend('reflected-SV-wave potential', 'reflected-P-wave potential', 'location', 'NorthWest');
xlabel('incident angle / ^o');
ylabel('reflectance of SV-wave');
hold on
plot(xlim, [0 0], 'k');
plot(7.4, 0, 'o')
text(7.4, 0, 'Polarization switching point');
% P4_1
alpha = 5; beta = 3;
beta2 = beta * beta;
alpha2 = alpha * alpha;
ip = 0:90;
is = rad2deg(asin(beta / alpha * sin(deg2rad(ip))));
den = beta2 * sin(deg2rad(2 * ip)) .* sin(deg2rad(2 * is)) + alpha2 * cos(deg2rad(2 * is)) .^ 2;
AA = beta2 * sin(deg2rad(2 * ip)) .* sin(deg2rad(2 * is)) - alpha2 * cos(deg2rad(2 * is)) .^ 2 ./ den;
BA = -2 * beta2 * sin(deg2rad(2 * ip)) .* cos(deg2rad(2 * is)) ./ den;
plot(ip, AA, 'k:', ip, BA, 'k--')
legend('P-wave potential', 'SV-wave potential');
xlabel('incident angle / ^o');
ylabel('reflectance of P-wave');
hold on
plot(xlim, [0 0],'k');
plot(12.3, 0, 'o')
text(12.3, 0, 'Polarization switching point')
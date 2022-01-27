% P4_3.m
is1 = 0:0.1:90;
vs1 = 3.9; vs2 = 4.49;
den1 = 2.9; den2 = 3.38;
csis1 = cos(deg2rad(is1));
csis2 = sqrt(1 - (vs2/vs1 * sin(deg2rad(is1))) .^ 2);
den = (den1 * vs1 * csis1 + den2 * vs2 * csis2);
flect = (den1 * vs1 * csis1 - den2 * vs2 * csis2) ./ den;
trans = 2 .* den1 * vs1 * csis1 ./ den;
figure(1)
subplot(2, 2, 1), plot(is1, real(flect), is1, imag(flect), ':', is1, abs(flect), '--');
grid on
xlabel('incident angle / ^o');
legend('Re', 'Im', 'Amplitude');
subplot(2, 2, 2), plot(is1, rad2deg(phase(flect)));
grid on
xlabel('incident angle / ^o');
ylabel('phase / ^o');

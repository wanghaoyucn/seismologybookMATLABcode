%P3-l.m
filename = 'wave1D.gif';
dx = 1; dt = 0.1; tlen = 3; c = 4; 
u1 = zeros(101, 1); u2 = u1; u3 = u1;
t = 0;
jj = 0;
while(t <= 33)
    jj = jj+1;
    for ii = 2:100
        rhs = c^2 * (u2(ii + 1) - 2 * u2(ii) + u2(ii - 1))/dx^2; 
        u3(ii) = dt ^ 2 * rhs + 2 * u2(ii) - u1(ii)
    end 
    u3(1) = u3(2); %left free
    u3(101) = 0.0; %right settled
    % u3(1) = u3(2); %left free
    %u3(101) =u3(100); %right free
    %u3(1)=0.0; %left settled
    % u3(101) = 0.0; %right settled
    if(t <= tlen)
    u3(51) = (sin(pi*t/tlen))^2;
    end
u1 = u2;
u2 = u3;
plot(u2);
axis([0, 101, -1.2, 1.2]);
xlabel('x/km')
ylabel('Amplitude')
f = getframe(gcf);
imind = frame2im(f);
[imind, cm] = rgb2ind(imind,256) , 
if jj == 1 
imwrite(imind, cm, filename,'gif','Loopcount', inf, 'DelayTime',0.05); 
else 
imwrite(imind, cm, filename, 'gif', 'writeMode', 'append', 'DelayTime', 0.1); 
end 
t = t + dt;
% pause 
end 




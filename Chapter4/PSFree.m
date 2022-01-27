%通用的计算P波和SV波在地表的反射系数程序
function [rt] = PSFree(vp, vs, hslow)
    % vp  % velocity of P-wave
    % vs  % velocity of S-wave
    % hslow  %水平慢度，相当于p
    % rt(1)  %向上传播P波转换为向下传播P波的反射系数
    % rt(2)  %向上传播P波转换为向下传播SV波的反射系数
    % rt(3)  %向上传播SV波转换为向下传播SV波的反射系数
    % rt(4)  %向上传播SV波转换为向下传播P波的反射系数
    rt = zeros(1,4);
    alpha = complex(vp, 0.);
    beta = complex(vs, 0.);
    p = complex(hslow, 0.);
    cone = complex(1, 0.);
    a = p * beta ^2;
    e = sqrt(cone - p^2 * alpha^2);
    f = sqrt(cone - p^2 * beta^2);
    b = e / alpha;
    c = f / beta;
    d = cone - 2 * (beta^2) * (p^2);
    A1 = 4 * b * c * a^2 + d^2;
    B1 = 4 * b * c * a^2 - d^2;
    C1 = (-cone) * 4 * a * b * d;
    A2 = A1;
    B2 = B1;
    C2 = 4 * a * b * d;
    rt(1) = B1/A1;
    rt(2) = C1/A1;
    % rt(2) = (C1/A1) * (alpha/beta); %位移反射系数
    rt(3) = B2/A2;
    rt(4) = C2/A2;
    % rt(4) = (C2/A2) * (alpha/beta);
    % attention!: rt(1)和rt(3)的位移反射系数和势反射系数相同
    return 
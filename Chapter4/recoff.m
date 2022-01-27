function [rt]=recoff(vp1,vs1,den1,vp2,vs2,den2,hslow) 
%RTCOEF 计算固体内部界面 P/SV 反射透射系数程序，公式参看
%Aki和Richards的《qultitative seismology》pp. 149-150 
%此MATLAB版本自Peter Shearer的《Introduction of Seismology》的FORTRAN子程序修改
% 输入参数：  vp1=上层P波速度；vs1=上层S波速度；den1  =上层密度；
%vp2=下层P波速度；vs2=下层S波速度；den2  =下层密度；
% hslow=水平慢度(射线参数p)
% 输出参数（复数型）：rt(1)=向下P波转换为向上P波的反射系数
% rt(2)=向下P波转换为向上SV波的反射系数
% rt(3)=向下P波转换为向下P波的透射系数
% rt(4)=向下P波转换为向下SV波的透射系数
% rt(5)=向下SV波转换为向上P波的反射系数
% rt(6)=向下SV波转换为向上SV波的反射系数
%rt(7)=向下SV波转换为向下P波的透射系数
%rt(8)=向下SV波转换为向下SV波的透射系数
% rt(9)=向上P波转换为向上P波的透射系数
% rt(10)=向上P波转换为向上SV波的透射系数
% rt(11)=向上P波转换为向下P波的反射系数
% rt(12)= 向上P波转换为向下SV波的反射系数
% rt(13)= 向上SV波转换为向上P波的透射系数
% rt(14) =向上SV波转换为向上SV波的透射系数
% rt(15)=向上SV波转换为向下P波的反射系数
% rt(16)= 向上SV波转换为向下SV波的反射系数
	rt=zeros(1,16);   %反射透射矩阵的16个元素
	alpha1=complex(vp1,0.);   %第一层P波速度的复数形式
	beta1=complex(vs1,0.);   %第一层S波速度的复数形式
	rho1=complex(den1,0.);    %第一层密度的复数形式
	alpha2=complex(vp2,0.);  %第二层P波速度的复数形式
	beta2=complex(vs2,0.);  %第二层S波速度的复数形式
	rho2=complex(den2,0.);    %第二层密度的复数形式
	p=complex(hslow,0.);     %射线参数p也变为复数形式
%  
	cone=complex(1,0.);     %1的复数形式
	ctwo=complex(2,0);      %2的复数形式
	term1=(cone-ctwo*beta1^2*p^2);   %
	term2=(cone-ctwo*beta2^2*p^2);
	a=rho2*term2-rho1*term1;
	b=rho2*term2+ctwo*rho1*beta1^2*p^2;
	c=rho1*term1+ctwo*rho2*beta2^2*p^2;
	d=ctwo*(rho2*beta2^2-rho1*beta1^2);
% MATLAB程序可以处理入射角为复数的正余弦问题
	si1=alpha1*p;
	si2=alpha2*p;
	sj1=beta1*p;
	sj2=beta2*p; 
	ci1=sqrt(cone-si1^2);
	ci2=sqrt(cone-si2^2);
	cj1=sqrt(cone-sj1^2);
	cj2=sqrt(cone-sj2^2);
	E=b*ci1/alpha1+c*ci2/alpha2;
	F=b*cj1/beta1+c*cj2/beta2;
	G=a-d*ci1*cj2/(alpha1*beta2);
	H=a-d*ci2*cj1/(alpha2*beta1);
	DEN=E*F+G*H*p^2;              
	trm1=b*ci1/alpha1-c*ci2/alpha2;
	trm2=a+d*ci1*cj2/(alpha1*beta2); %向下P波转换为向上P波的反射系数
	rt(1)=(trm1*F-trm2*H*p^2)/DEN;      
	trm1=a*b+c*d*ci2*cj2/(alpha2*beta2);
    rt(2)=(-ctwo*ci1*trm1*p)/(alpha1*DEN); %向下P波转换为向上SV波的反射系数
	rt(3)=ctwo*rho1*ci1*F/(alpha2*DEN);    %向下P波转换为向下P波的透射系数
	rt(4)=ctwo*rho1*ci1*H*p/(beta2*DEN);   %向下P波转换为向下SV波的透射系数
	trm1=a*b+c*d*ci2*cj2/(alpha2*beta2);
	rt(5)=(-ctwo*cj1*trm1*p)/(alpha1*DEN);  %向下SV波转换为向上P波的反射系数
	trm1=b*cj1/beta1- c*cj2/beta2;
	trm2=a+d*ci2*cj1/(alpha2*beta1); 
	rt(6)= -(trm1*E-trm2*G*p^2)/DEN;      %向下SV波转换为向上SV波的反射系数
	rt(7)= -ctwo*rho1*cj1*G*p/(alpha2*DEN);  %向下SV波转换为向下P波的透射系数
	rt(8)= ctwo*rho1*cj1*E/(beta2*DEN);     %向下SV波转换为向下SV波的透射系数
	rt(9)= ctwo*rho2*ci2*F/(alpha1*DEN);    %向上P波转换为向上P波的透射系数
	rt(10)= -ctwo*rho2*ci2*G*p/(beta1*DEN);  %向上P波转换为向上SV波的透射系数
	trm1=b*ci1/alpha1-c*ci2/alpha2;
	trm2=a+d*ci2*cj1/(alpha2*beta1);
	rt(11)=-(trm1*F+trm2*G*p^2)/DEN;      %向上P波转换为向下P波的反射系数
%
	trm1=a*c+b*d*ci1*cj1/(alpha1*beta1);
	rt(12)=(ctwo*ci2*trm1*p)/(beta2*DEN);    %向上P波转换为向下SV波的反射系数
%
	rt(13)=ctwo*rho2*cj2*H*p/(alpha1*DEN);   %向上SV波转换为向上P波的透射系数	rt(14)=ctwo*rho2*cj2*E/(beta1*DEN);    %向上SV波转换为向上SV波的透射系数
%
	trm1=a*c+b*d*ci1*cj1/(alpha1*beta1);
	rt(15)=(ctwo*cj2*trm1*p)/(alpha2*DEN);    %向上SV波转换为向下P波的反射系数
%
	trm1=b*cj1/beta1-c*cj2/beta2;
	trm2=a+d*ci1*cj2/(alpha1*beta2); 
	rt(16)=(trm1*E+trm2*H*p^2)/DEN;      %向上SV波转换为向下SV波的反射系数
	return   %子程序结束

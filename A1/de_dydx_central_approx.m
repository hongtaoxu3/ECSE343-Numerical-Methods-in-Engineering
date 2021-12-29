% Q2 d 
clear all 
h = logspace(-20,0,100) % provided during TUT 

x0 = pi/4; 
der = cos(x0);
dydxapprox = (sin(x0+h)-sin(x0-h))./ (2*h); 

abs_error = abs(der - dydxapprox); %difference btw der. and approx method 
truncation_error = abs(cos(x0))*h.^2/6; % get from abs error 

clf 
figure(1)
loglog(h,abs_error,'r')
hold on 
figure(1)
loglog(h,truncation_error,'b')

xlabel('h')
ylabel('absolute error')

legend('absolute error','truncation error')

%2 e 
% after observed two plots, i believe that dydx_central_approx method gives 
% the smaller error because at the same x(means h) value, the central method 
% would has a much smaller y (error) value. For example, at x=5.591e-06, 
% there is y=1.977e-6 on dydx_approx graph while y=3.684e-12 on
% dydx_central graph which is much smaller. 
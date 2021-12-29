% Q2 b 
clear all 
h = logspace(-20,0,100) % provided during TUT 

x0 = pi/4; 
der = cos(x0);
dydxapprox = (sin(x0+h)-sin(x0))./ h; 

abs_error = abs(der - dydxapprox); %difference btw der. and approx method 
truncation_error = abs(sin(x0))*h/2; % get from abs error 

% drawing the diagram 
clf 
figure(1)
loglog(h,abs_error,'r')
hold on 
figure(1)
loglog(h,truncation_error,'b')

xlabel('h')
ylabel('absolute error')

legend('absolute error','truncation error')

% the error is smooth of the error for large values of h 
% while it is erratic for small values of h is because that 
% the machine error in the epsilon 

% Q2 c 
% i believe that the minimum error happens when the absolute error 
% become linear in the diagram, which is about h = 8.302e-9.
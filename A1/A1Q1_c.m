% Q1 c 
eps('single')
% The single-precision floating-point representation:
% has 32-bit; the first bit is the sign bit, with 0 for positive 
% and 1 for negative; the following 8 bits represent exponent; 
% the left 23 bits represent mantissa. 
% Epsilon at 1, single eplision equal to 2^-23.
single_epsilon = 2^-23 = 1.1921e-07
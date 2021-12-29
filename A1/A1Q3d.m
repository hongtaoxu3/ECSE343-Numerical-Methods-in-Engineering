A = [1e-16 2 5 5; 0.2 1.6 7.4 5; 0.5 4 8.5 5; 0.5002 8 11 97];
b = [400;5;18;95]
[L,U] = LU_decomposition(A);
y = forward_sub(L,b);
x = backward_sub(U,y);

function [L,U] = LU_decomposition(A)
[row,col] = size(A);
if row ~= col
    L=0;
    U=0;
    return;
end

col = size(A,1);
for a = 1:col-1
    for b=a+1:col
        A(b,a) = A(b,a) / A(a,a);
        A(b,a+1:end) = A(b,a+1:end) - A(b,a)*A(a,a+1:end); 
    end  
end    
L = tril(A,-1)+eye(col); 
U = triu(A); 
end

function y = forward_sub(L,b)
l = length(b)
y = zeros(l,1);
y(1,1) = b(1)./L(1,1)
for j = 2:l
    y(j,1) = (b(j)-sum(L(j,1:j-1)*y(1:j-1,1)))./L(j,j);
end
end

function x = backward_sub(U,b) 
l = length(b)
x = zeros(1,l);
x(1,l)=b(end)./U(l,l);
for i = l-1:-1:1
    temp = 1/U(i,i).*(b(i)-sum(U(i,i+1:end).*x(i+1:end)))
    x(1,i) = temp;
end
x=x'
end



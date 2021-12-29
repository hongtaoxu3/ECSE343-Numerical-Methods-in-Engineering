A = [1e-16 2 5 5; 0.2 1.6 7.4 5; 0.5 4 8.5 5; 0.5002 8 11 97];
b = [400;5;18;95]
[L,U,P] = LU_rowpivot(A)
y = forward_sub(L,b);
x = backward_sub(U,y);
% part e is more accurate 

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


function [L, U, P] = LU_rowpivot(A)
[row,col] = size(A); % row and column
if row ~= col
    L = 0;
    U = 0;
    return;
end
col = size(A,1);
P = eye(col)
for i = 1:col-1
if abs(A(i,i)) < 2
        e = eye(col); 
        [~,n] = max(abs(A(i:end,i))); 
        temp1 = e(i,:);
        e(i,:) = e(n+i-1,:);
        e(n+i-1,:) = temp1;
        A = e*A;
        P = e*P; 
    end
    for z=i+1:col
        A(z,i) = A(z,i) / A(i,i);
        A(z,i+1:end) = A(z,i+1:end) - A(z,i)*A(i,i+1:end);
    end
end
U =triu(A);
L = tril(A,-1)+eye(col);
end






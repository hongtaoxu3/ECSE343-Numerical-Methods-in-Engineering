A = [1e-16 2 5 5; 0.2 1.6 7.4 5; 0.5 4 8.5 5; 0.5002 8 11 97]; 
[L,U] = LU_decomposition(A)
y = L*U

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




        

b = [400;5;18;98]
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

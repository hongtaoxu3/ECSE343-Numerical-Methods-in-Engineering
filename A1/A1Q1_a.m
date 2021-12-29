% Q1 a 
a=ep(1)
a=ep(2)
a=ep(3)
a=ep(4)
a=ep(5)
a=ep(7)
a=ep(8)
a=ep(15)
a=ep(200)
a=ep(1022)
a=ep(1023)
a=ep(1.3e6)

function eplison = ep(n)
    eplison = double(1);
    r = eplison/2;
    while (n+eplison) ~= n
        eplison = eplison/2; 
        r = eplison/2; 
    end 
    eplison = eplison*2;
end 

% the results are getting larger and larger, even from
% ep(1) = 2.2204e-16 at beginning reaches to ep(2) = 2.3283e-10 
% in the end, which is a huge difference 




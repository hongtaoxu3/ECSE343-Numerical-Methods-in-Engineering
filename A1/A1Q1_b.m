%Q1 b 
a=rel_ep(1)
a=rel_ep(2)
a=rel_ep(3)
a=rel_ep(4)
a=rel_ep(5)
a=rel_ep(7)
a=rel_ep(8)
a=rel_ep(15)
a=rel_ep(200)
a=rel_ep(1022)
a=rel_ep(1023)
a=rel_ep(1.3e6)

function rel_eplison = rel_ep(n)
         rel_eplison = double(1);
         rel_r = rel_eplison/2;
         while (n+rel_eplison) ~= n
             rel_eplison = rel_eplison/2; 
             rel_r = rel_eplison/2; 
         end 
         rel_eplison = rel_eplison*2/n;
end 

% the results i got in part b are all around 2e-16, 
% there is not a large difference compare to the results 
% in part a, for example, rel_ep(1) = 2.2204e-16 
% while rel_ep(1.3e6) = 1.7910e-16, which are close 
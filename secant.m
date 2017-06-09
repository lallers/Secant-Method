function [root,P] = secant(f,x0,x1,tol,kmax)
%/////////////////////////////////////////////////////////
% By: Lee Allers                                         /
%For: Numerical Computation, 2016                        /
%     University of New Mexico                           /
%NOTE: None of my scripts are built to be robust, they   /
%      are merely an implementation of a given set of    /
%      data or instructions!                             /
%/////////////////////////////////////////////////////////
k = 1;
root = (x0*f(x1) - x1*f(x0))/(f(x1) - f(x0));

while k < kmax
    if k == 1
        err(k) = root;
    end
    rootold = root;
    x0 = x1;
    x1 = root;
    fx0 = f(x0);
    fx1 = f(x1);
    root = (x0*fx1 - x1*fx0)/(fx1 - fx0);
    
    if k > 1 && k < 3
    err(k) = abs(rootold-root);
    elseif k >=3 
    err(k) = (log(err(k))-log(k-1))/(log(k-1)-log(k-2));
    end
    k = k + 1;
    if abs(f(root) < tol)
        disp('Tolerance Met!')
        break;
    end
end
end
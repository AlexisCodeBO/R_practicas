function [J,theta] = trainLinearReg(X, y, lambda)
    [m, n] = size(X);
    theta = zeros(n, 1);
    niter = 10500;
    alpha = 0.001;
    J = zeros(niter, 1);
    for i=1:niter
        [J(i) grad] = linearRegCostFunction(X,y, theta, lambda);
        theta = theta - alpha *grad;
    end
end        
        
    
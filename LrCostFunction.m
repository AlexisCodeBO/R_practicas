function [J Grad] = LrCostFunction(X, g, theta)
    J = 0;
    [m,n] = size(X);
    X = [ones(m,1) X];
    Grad = zeros(n+1, 1);
    ht = Sigmoide(X*theta);
    J= -g' * log(ht)- (1-g)' * log(1-ht);
    Grad = X' *(ht - g);
end
function [theta] = GradDL(theta, X, g, alpha, niter)
    for i=1:niter
        [J Grad]= LrCostFunction(X, g, theta);
        theta =theta -(alpha * Grad);
    end
end
function [theta] = GradD(theta, X, y, alpha, niter)
    for i=1:niter
        theta =theta -alpha *X' * (X* theta -y);
    end
    
    
end
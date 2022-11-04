function [P]= PredictOnevsAll(ThetaAll, X) 
    [m n]= size(X);
    X = [ones(m,1) X];
    P = Sigmoide(X* ThetaAll);
    P = P>=0.5;
end    
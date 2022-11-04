function [P]= Predict(theta, X)
    [m n]= size(X);
    X =[ones(m,1) X];
    P= Sigmoide(X * theta);
    P= P>= 0.5;
end

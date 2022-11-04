function [g]= Sigmoide(z)
    g = 1./(1+exp(-z));
end
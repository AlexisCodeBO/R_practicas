function [pred] = Predict2(Theta1, Theta2,X)
    m = size(X, 1);
    num_labels = size(Theta2, 1);
    pred = zeros(size(X, 1), 1);
    X = [ones(m, 1) X];
    a2 = Sigmoide(Theta1*X');
    %a2 = a2';
    %a2 = [ones(size(a2,1),1) a2];
    a2 = [ones(1,m); a2];
    a3 = Sigmoide(Theta2*a2);
    [Y,I] = max(a3, [], 1);
    pred = I';
end

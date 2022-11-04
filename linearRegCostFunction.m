function [J, grad]= linearRegCostFunction(X, y, theta, lambda)
    m = length(y); % Número de casos
    J = 0; % Resultado de la función costo
    W = (X * theta)- y;
    J =1/(2* m) * (W'*W + lambda * theta(2:end)'*theta(2:end));
    grad = zeros(size(theta));
    thetaw = theta;
    thetaw(1) = 0;
    grad = 1/m *(X' * W+lambda * thetaw);
  
end
    

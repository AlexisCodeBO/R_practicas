function [ J, grad ] = NNcostofuncion(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y)
%% Enrollar los parámetros
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
hidden_layer_size, (input_layer_size + 1));


Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
                        
m = size(X, 1);
         
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

%% Calcular J
    for i=1:m
      for k=1:num_labels
        J=J + Y(k,i)*log(a3(k,i)) + (1-Y(k,i))*log(1-a3(k,i));
      end;
    end;
    J=-J/m;
    
%% Calcular el gradiente
A1=zeros(size(Theta1)); % (25x401)
A2=zeros(size(Theta2)); % (10x26)

%% Algoritmo backpropagation

for t=1:m
  %Step 1
  a1=X(t,:);  %1x401
  z2=Theta1*a1';   % z2(25x1)=Theta1(25x401)*a1'(401x1)
  a2=sigmoid(z2);  % a2(25x1)
  a2=[1; a2];      % 26x1
  z3=Theta2*a2;    % z3(10x1)=Theta2(10x26)*a2(26x1)
  a3=sigmoid(z3);  % a3(10x1)
  %Step 2
  d3=a3-Y(:,t);      % d3(10x1)=a3(10x1)-Y(:,t)(10x1)
  %Step 3
  d2=Theta2'*d3.*a2.*(1-a2);  %d2(26x1)=Theta2'(26x10)*d3(10x1).*a2(26x1).*(1-a2)(26x1)
  %Step 4
  A1=A1+d2(2:end)*a1; % A1(25x401)=A2+d2(25x1)*a1(1x401);  
  A2=A2+d3*a2';       % A2(10x26) =A2+d3(10x1)*a2'(1x26)       
end;

Theta1_grad=(1/m)*A1;
Theta2_grad=(1/m)*A2;

%% Desenrollar el gradiente
grad = [Theta1_grad(:) ; Theta2_grad(:)];

end


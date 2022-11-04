% Alumno: Alexis Barrios Echalar 26/11/2021
%% Atributos red neuronal
input_layer_size  = 400;  % 20x20 Input Images of Digits
hidden_layer_size = 25;   % 25 hidden units
num_labels = 10;          % 10 labels, from 1 to 10

%% Inicializar pesos

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

%% Forward propagation
X = [ones(m, 1) X];
a3 = sigmoid( Theta2 * [ones(1,m); sigmoid(Theta1*X')] );

%% Recodificar las salidas
%Y contiene la recodificación de los dígitos
Y = zeros(num_labels,m);  %Y(10x5000)
    for c=1:m
      Y(y(c),c)=1;
    end;

%% Entrenar la red
options = optimset('MaxIter', 50);

%% Crear una función
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y)
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

%% Volver a enrollar
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

%% Predecir 
pred = predict(Theta1, Theta2, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);






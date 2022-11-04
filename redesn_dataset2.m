%12/11/2021 Alexis Barrios 15/11/2021 Usa la función predict
load('ex3data1.mat'); %Carga de X, Y
[m p]= size(X);
sel = randperm(m);
sel = sel(1:100);   
displayData_nuevo(X(sel, :));

%% Cargar pesos
load('ex3weights.mat');

%% Estructura de la red
input_layer_size = 400;
hidden_layer_size = 25;
num_labels = 10;
[pred] = Predict2(Theta1, Theta2, X);
rp = randperm(m);

for i = 1:m
    % Display 
    fprintf('\nDisplaying Example Image\n');
    displayData_nuevo(X(rp(i), :));

    pred = Predict2(Theta1, Theta2, X(rp(i),:));
    fprintf('\nNeural Network Prediction: %d (digit %d)\n', pred, mod(pred, 10));
    
    % Pause
    fprintf('Program paused. Press enter to continue.\n');
    pause;
end


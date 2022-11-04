%%
P= prostate;
corrcoef(table2array (P(:, 1:end-2)))
%% Balancear los datos
X =table2array(P(:, 1:8));
[X, mu, sigma]= zscore(X); % Balancemos al matrix X la desviación e. de cada variable

%% Seleccionar X aquellos que correspondan a T= Xtrain
% convertir a logical
P.train = logical(P.train =="T");
Xtrain = X(P.train,:); %Convertir a logical // Xtrain= X(idx, :)// idx= matriz lógica de los Train y false
Ytrain = P(P.train, 9);

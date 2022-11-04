A= Advertising;

ventas= A.sales;
radio=A.radio;
tv= A.TV;
newspaper = A.newspaper;

scatter(radio, ventas)
corrcoef([radio ventas])
%% Preparar la matriz X
[m,p]= size(radio);
X= [ones(m,1) radio];

%% Encontrar los parámetros
Aw = X'*X;
b = X' * ventas;
Theta= Aw\b;
%% Función de regresión
F = @(x) Theta(1) + Theta(2)*x;
hold on
fplot(F, [0 300])

%% Regresión multi
X = [ones(m,1) tv newspaper radio];
%% encontrar parámetros
Aw = X'*X;
b= X' * ventas;
Theta= Aw\b;
Error = X * Theta - ventas;
errorq = Error .* Error;


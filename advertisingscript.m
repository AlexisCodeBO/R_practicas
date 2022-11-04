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

%% Encontrar los par�metros
Aw = X'*X;
b = X' * ventas;
Theta= Aw\b;
%% Funci�n de regresi�n
F = @(x) Theta(1) + Theta(2)*x;
hold on
fplot(F, [0 300])

%% Regresi�n multi
X = [ones(m,1) tv newspaper radio];
%% encontrar par�metros
Aw = X'*X;
b= X' * ventas;
Theta= Aw\b;
Error = X * Theta - ventas;
errorq = Error .* Error;


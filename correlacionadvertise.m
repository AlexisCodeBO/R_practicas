A= Advertising;
[t n]= size(A.TV);

corrcoef([A.TV A.radio A.newspaper A.sales])

X = [ones(t, 1) A.TV A.radio A.newspaper];

[N p1] = size(X);
%% Encontrar parámetros / coeficientes. Ecuaciones / variables
Aw = X' * X;
b = X' * A.sales;
theta = Aw\b;

%% Predecir ventas
ventas = X * theta;

%% Error
RSS = (ventas - A.sales)' * (ventas - A.sales);
StdError = (ventas - A.sales); 

%% Std. error
sigma2 = RSS /(N - p1);
sigma = sqrt(sigma2);
v = diag(inv(X' * X));
std = sigma * sqrt(v);

%% Z-score
Z = theta./std;

%% P-value
P = 1- tcdf(Z, N -p1);  % Probability of larger t-statistic
sigmacopiado = [sigma; sigma; sigma; sigma]

Tres1= table(theta, Z, P, sigmacopiado, 'RowNames', {'Intercept', 'TV', 'radio', 'newspaper'})

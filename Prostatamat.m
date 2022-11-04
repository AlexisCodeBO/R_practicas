%% Leer los datos
P= prostate;
corrcoef(table2array(P(:, 1:end-2)));

%% Balancear los datos
X = table2array(P(:,1:8));
[X,mu, sigma]= zscore(X);

%% Seleccionar X aquellos que correspondan a Xtrain
% convertir a logical
P.train= logical(P.train == "T");
Xtrain = X(P.train, :) %% Crea como matriz
ytrain = P{P.train, 9} %% Lo crea como vector

%% Calcular los resultados
[m, n]= size(Xtrain);
CC = corrcoef(Xtrain);
Xtrain = [ones(m,1) Xtrain];
A = Xtrain' * Xtrain;
b = Xtrain' * ytrain;
theta = A \ b;

%% Predecir
yp = Xtrain * theta;
epe = mean((yp - ytrain).*(yp - ytrain)); %train
Xtest = X(~P.train, :);
ytest = P{~P.train, 9};
[mt, nt] = size(Xtest);
Xtest = [ones(mt,1) Xtest];
ypt = Xtest * theta;

%% Estimar el promedio del error de predicción para test
epet = mean((ypt-ytest).*(ypt-ytest));
epetrain = mean((yp-ytrain).*(yp-ytrain)); %train

%% Resolver con descomposición QR
[Q R] = qr(Xtrain);
k = rank(Xtrain);
g = Q' * ytrain;
g1 = g(1:k);
R11 = R(1:k,1:k);
l1= R11\g1;
thetaQR= l1;

%% Resolver con descomposición svd
[U, S, V] = svd(Xtrain);
g = U' * ytrain;
g1 = g(1:k);
R11 = S(1:k, 1:k);
l1 = R11\g1;
thetasvd = V * l1;

%% Gradiente descendiente
niter = 10000;
alpha = 0.001;
theta = zeros(n+1, 1);
[thetaGD] = GradD(theta, Xtrain, ytrain, alpha, niter);
    
%% Error
Error = V * thetasvd;
Errorq = Error .* Error;

%% Regularización
niter = 10000;
alpha = 0.001;
theta = zeros(n+1, 1);
[thetaGD] = GradD(theta, Xtrain, ytrain, alpha, niter);

lambda= 24;
[J thetar]=trainLinearReg(Xtrain, ytrain, lambda);
% for lambda= 0:100
%     lambda= i;
%     [J thetar]= trainLinearReg(Xtrain, ytrain, lambda);
% 
% end


%% Determinación de lambda
for lambda=1:100
    [J thetar]= trainLinearReg(Xtrain, ytrain, lambda);
    Error = Xtrain * thetar - ytrain;
    Errorq(lambda) = Error .* Error;
end

for lambda=1:1000
    [J thetar]= trainLinearReg(Xtrain, ytrain, lambda);
    Error = Xtest * thetar - ytest;
    EPE(lambda) = Error .* Error;
end

%% Cálculo de estadísticos acerca de los coeficientes
[m n]= size(Xtrain);
ys = Xtrain * thetaQR;
epes = (ytrain - ys)' *(ytrain - ys);
sigmas = epes/ (m-n);
v= diag(inv(Xtrain' * Xtrain));
stde = sigmas * sqrt(v);


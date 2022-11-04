%% Leer los datos
W= load('zip.train');
% Eliminamos la primera columna
y = W(:,1);
W= W(:,2:end);
index = y==0;
y(index) =10;
%% Desplegar los datos
[m, n]= size(W);
sel = randperm(m); 
sel = sel(1:100);
displayData(W(sel, :));

%%
%k=10;
%p=10
%theta = zeros(p+1, k);
digito= 4;
g = y ==digito;
X = W;
[m n]= size(X);
theta = zeros(n+1, 1);
niter= 1000;
alpha = 0.01;
[theta] = GradDL(theta, X,g,alpha, niter);

%% Predicción
P= Predict(theta, X);

rp = randperm(m);


for i = 1:m
    % Display 
    fprintf('\nImagen del ejemplo\n');
    displayData(X(rp(i), :));

    predej = Predict(theta,X(rp(i),:));
    fprintf('\nPredicción: %d (dígito %d)\n', predej, mod(predej, 10));
    
    % Pause
    fprintf('Pausa. Presione enter para continuar.\n');
    pause;
end

%% Testeo
WTest = load('zip.test');
[mTest, nTest]=size(WTest);
yTest = WTest(:,1);
XTest = WTest(:,2:end);
gTest = yTest== digito;

PTest = Predict(theta, X);

Y = PTest;
G = gTest;

%% Métricas
% Calculo de la exactitud
exactitud = sum(P==g)/m*100;

%% Matriz de confusión
C= zeros(2,2);
C(1,1)= sum((Y==0).*(G==0));
C(1,2)= sum((Y==1).*(G==0));
C(2,1)= sum((Y==0).*(G==1));
C(2,2)= sum((Y==1).*(G==1));

Nast = C(1,1)+ C(2,2);
Past = C(1,2)+ C(2,2);
NN = C(1,1)+ C(1,2);
PP = C(2,1)+ C(2,2);
T = Nast+Past;

%% Especifidad - Error de tipo 1
ErrorI = C(1,2) / NN*100;
Spec = 100 - ErrorI;

%% Sensibilidad
Sens =C(2,2) /PP*100;

%% Precisión
PresP = C(2,2)/Past *100;
PresN = C(1,1)/Nast *100;

%% Exactitud
Exac = (C(1,1)+C(2,2))/T*100;



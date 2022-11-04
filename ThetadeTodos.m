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
limit = 10;
ThetaAll = zeros(n + 1, 1);

for i= 1:limit
    g= y==1;
    X= W;
    [m n]= size(X);
    theta =zeros(n + 1,1);
    niter = 5000;
    alpha = 0.01;
    [theta] = GradDL(theta, X,g,alpha, niter);
    ThetaAll(:,i)= theta;
end

%% Predicción

rp = randperm(m);


for i = 1:m
    % Display 
    fprintf('\nImagen del ejemplo\n');
    displayData(X(rp(i), :));
    predej= PredictOnevsAll(ThetaAll, X(rp(i), :));

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
idx = yTest==0;
yTest(idx) =10;
XTest = WTest(:,2:end);
CC = PredictOnevsAll(ThetaAll, XTest);

PTest = PredictOnevsAll(ThetaAll, XTest);

%% funcion fmincg
for c=1:num_labels,
    initial_theta = zeros(n + 1,1);
    options = optimset('GradoObj', 'on', 'MaxIter', 50);
    [theta] = fmincg(@(t)(lrCostFunction(t, X, (y == c), lambda)), ...
            initial_theta, options);
    all_theta(c,:)= theta;
end

%% Exactitud Test
exactitudTest = (sum(CC==yTest)) / mTest;
    
%% Leer los datos
W= load('zip.train');
% Eliminamos la primera columna
W =W(:, 2:end);

%% Desplegar los datos
[m,n]= size(W);
sel= randperm(m);
displayData(W(sel, :));

%% Clusterización o agrupamiento con naranja y verde
K=15; % K centroides
initial_centroids= kMeansInitCentroids(W,K);
displayData(initial_centroids);

%% Etiquetar los datos
idx= findClosestCentroids(W, initial_centroids);

%% Volver a calcular los centroides
centroids = computeCentroids(W, idx, K);
displayData(centroids);

%% Ejecutar k-means
max_iter= 50;
[centroids, idx] = runkMeans(W, centroids, max_iter);
displayData(centroids);

%% Desplegar los clústers
figure
for i=1:K
    aux= idx ==i;
    Xaux = W(aux,:);% Selecciona todos los de etiqueta i
    displayData(aux);
    fprintf('Pausa. Presione enter para continuar.\n');
    title(strcat('Cluster', num2str(i)));
    pause;
end








%% Leer la imagen
A= double(imread('lenna.jpg'));
A= A /255; %Dividir por 255 para así tener los valores en rango de 0 a -1

%% Obtener el dataset
img_size= size(A);
X= reshape (A, img_size(1) * img_size(2), 3); %Dataset

%% Comprimir con K-means, seleccionando 16 colores
K=16; % 16
initial_centroids = kMeansInitCentroids(X,K);

%% Ejecutar k-means
max_iters= 10; % 10
[centroids, idx]= runkMeans(X, initial_centroids, max_iters);

%% Recuperar la imagen
idx=findClosestCentroids(X, centroids);
X_recovered = centroids(idx, :);
A_recovered= reshape(X_recovered, img_size(1), img_size(2), 3);

%% Mostrar imágenes
subplot(1,2,1);
image(A);

subplot(1,2,2);
image(A_recovered);


%% Generar imagen
%Ejecutar finalmente para guardar la imagen y matriz
AW=reshape(idx, img_size(1), img_size(2));
imwrite(AW, centroids, 'LENA.bmp');

% save 'rene.mat' centroids idx img_size


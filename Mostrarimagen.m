load LENNA_T.mat
X_recovered = centroids(idx, :);
A_recovered= reshape(X_recovered, img_size(1), img_size(2), 3);
image(A_recovered);

% save 'rene.mat' centroids idx img_size

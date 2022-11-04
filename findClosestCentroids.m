function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
% Instrucciones: Revise cada ejemplo, busque su centroide más cercano y almacene
%               El índice dentro de idx en la ubicación apropiada.
%               Concretamente, idx (i) debe contener el índice del centroide
%               Más cercano al ejemplo i. Por lo tanto, debe ser un valor en el
%               Rango 1..K
%
% Nota: Puede usar un bucle for-loop sobre los ejemplos para calcularlo.

for i = 1:size(X, 1)
  min_d = inf;
  for k = 1:K
    diff = X(i, :)'-centroids(k, :)';
    d = diff'*diff;% cuadrado de la distancia
    if (d < min_d)
      idx(i) = k;
      min_d = d;
    end
  end
end


% =============================================================

end


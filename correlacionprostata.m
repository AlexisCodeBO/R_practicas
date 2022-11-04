P= prostate;

[t n]= size(P.lcavol);

P.train= logical(P.train == "T");

corrcoef([P.lcavol P.lweight P.age P.lbph P.svi P.lcp P.gleason P.pgg45 P.lpsa P.train])

X = [ones(t, 1) P.lcavol P.lweight P.age P.lbph P.svi P.lcp P.gleason P.pgg45 P.lpsa];

[N p1] = size(X);
%% Encontrar parámetros / coeficientes. Ecuaciones / variables
Aw = X' * X;
b = X' * P.train;
theta = Aw\b;

%% Predecir resultado
detector = X * theta;

%% Error
RSS = (detector - P.train)' * (detector - P.train);
StdError = (detector - P.train); 

%% Std. error
sigma2 = RSS /(N - p1);
sigma = sqrt(sigma2);
v = diag(inv(X' * X));
std = sigma * sqrt(v);

%% Z-score
Z = theta./std;

%% P-value
P = 1- tcdf(Z, N -p1);  % Probability of larger t-statistic
sigmacopiado = [sigma; sigma; sigma; sigma; sigma; sigma; sigma; sigma; sigma; sigma]

Tres2= table(theta, sigmacopiado, Z , 'RowNames', {'lcavol','lweight','age','lbph','svi','lcp','gleason','pgg45','lpsa','train'})

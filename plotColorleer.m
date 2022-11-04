x = -pi:pi/10:pi;
y = tan(sin(x)) - sin(tan(x));
figure
plot(x,y,'--gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.5,0.5,0.5])

plot(1,1, 'Color', initial_centroids(1,:))
plot(1,1, 'Color', initial_centroids(1,:))
plot(1,1, '*', 'Color', initial_centroids(1,:))
plot(1,1, 's', 'Color', initial_centroids(1,:))
plot(1,1, 's', 'Color', initial_centroids(2,:))
plot(1,1, 's', 'Color', initial_centroids(2,:))

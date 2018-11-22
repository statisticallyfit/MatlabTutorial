%% Draw 2D triangle
% matrix of three points (first row is all x values and bottom row is all y
% values)
function drawTriangle(matOfThreePoints, color) 
p = matOfThreePoints(:, 1);
q = matOfThreePoints(:, 2);
r = matOfThreePoints(:, 3);

drawVector([4 5]);

% plot and shade it in
x = matOfThreePoints(1, :)';
y = matOfThreePoints(2, :)'; 
patch(x, y, color, 'EdgeColor', color, 'FaceColor', color, 'LineWidth', 3, 'FaceAlpha', 0.4)

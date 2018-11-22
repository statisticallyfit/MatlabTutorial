function plotVectors(px,py, vx,vy)
% Plot the curve [x,y] and the vectors [vx,vy]
  % First the curve
  plot(px,py);
  hold on
  % Then the vectors
  lx = [px; px+vx; nan(size(px))];
  ly = [py; py+vy; nan(size(py))];
  plot(lx(:),ly(:));
  % Finally add markers at the "heads"
  plot(px+vx,py+vy,'.');
  grid on
  hold off
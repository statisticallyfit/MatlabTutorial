function plotVectors(px,py,pz, vx,vy,vz)
% Plot the curve [x,y,z] and the vectors [vx,vy,vz]
  % First the curve
  plot3(px,py,pz);
  hold on
  % Then the vectors
  lx = [px; px+vx; nan(size(px))];
  ly = [py; py+vy; nan(size(py))];
  lz = [pz; pz+vz; nan(size(pz))];
  plot3(lx(:),ly(:),lz(:));
  % Finally add markers at the "heads"
  plot3(px+vx,py+vy,pz+vz,'.');
  grid on
  hold off
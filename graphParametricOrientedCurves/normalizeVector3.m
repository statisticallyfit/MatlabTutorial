function [xo, yo, zo,l] = normalizeVector3(xi,yi,zi)
  l=sqrt(xi.^2+yi.^2+zi.^2);
  l(l~=0) = 1./l(l~=0);
  xo = xi.*l;
  yo = yi.*l;
  zo = zi.*l;
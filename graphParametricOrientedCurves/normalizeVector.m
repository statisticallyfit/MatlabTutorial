function [xo, yo,l] = normalizeVector(xi,yi)
  l=sqrt(xi.^2+yi.^2);
  l(l~=0) = 1./l(l~=0);
  xo = xi.*l;
  yo = yi.*l;
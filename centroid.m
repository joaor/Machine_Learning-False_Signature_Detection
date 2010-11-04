function [c1,c2] = centroid(pic)

[rc,cc] = ndgrid(1:size(pic,1),1:size(pic,2));
Mt = sum(pic(:));
c1 = sum(pic(:) .* rc(:)) / Mt;
c2 = sum(pic(:) .* cc(:)) / Mt;

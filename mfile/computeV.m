function [V]=computeV(phi,r);
V=zeros(size(phi,1),1);
for i=1:size(V)
V(i)=min( phi(i,:)+r' );
end;

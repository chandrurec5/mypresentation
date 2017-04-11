function [phi]=genphi(x,a)
for j=1:length(a)
	for i=1:length(x)
	phi(i,j)=2*abs(x(i)-a(j));
	end;
end;


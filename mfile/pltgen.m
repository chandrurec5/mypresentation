clear all;
x=-1:0.01:1;
f=(x.*x)';
fptr=fopen('f.dat','w');
for i=1:length(x)
	fprintf(fptr,'%e\t%e\n',x(i),x(i)^2);
end;
fclose(fptr);
a=-1:0.4:1;
a=a+0.2;
a=a(1:5);
phi=genphi(x,a);
r=zeros(size(phi,2),1);
for i=1:size(phi,2)
r(i)=-min(phi(:,i)+r(i)-f);
end;
V=computeV(phi,r);
fptr=fopen('fproj.dat','w');
for i=1:length(x)
fprintf(fptr,'%f\t%f\n',x(i),V(i));
end;
fclose(fptr);
for j= 1:size(phi,2)
	fptr=fopen(strcat('f',num2str(j),'.dat'),'w');
	for i=1:length(x)
		if(x(i)<a(j)+0.4 & x(i)>a(j)-0.4)
		fprintf(fptr,'%f\t%f\n',x(i),phi(i,j)+r(j));
		end;
	end;
	fclose(fptr);
end;



for j= 1:size(phi,2)
	fptr=fopen(strcat('fo',num2str(j),'.dat'),'w');
	for i=1:length(x)
		if(x(i)<a(j)+0.4 & x(i)>a(j)-0.4)
		fprintf(fptr,'%f\t%f\n',x(i),phi(i,j));
		end;
	end;
	fclose(fptr);
end;



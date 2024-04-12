function turningpoints
%Orbit visualization for various values of radii ratios
%   Visualizes orbits for given radii ratio values across the turning
%   points of a curve of rc/rc and velocity cost. Some imaginary geometry
%   is produced, but is inherently ignored by MATLAB

%less than 11.94

%intiial values and geometry
mu = 398600;
ra = 1500;
rbra = 5;
rcra = 2.02;
rb = rbra*ra;
rc = rcra*ra;
a2 = (ra+rb)/2;
a3 = (rb+rc)/2;
e2 = (rb-ra)/(rb+ra);
b2 = a2*sqrt(1-e2^2);
h2 = rb-a2;
e3 = (rb-rc)/(rb+rc);
b3 = a3*sqrt(1-e3^2);
h3 = rb-a3;

%obtaining transfer curves
x1 = linspace(-1500,1500,10000);
y1 = sqrt((ra^2)-x1.^2);
y11 = -sqrt(ra^2 - x1.^2);

x4 = linspace(-7500,1500,100000);
y4 = sqrt((b2^2).*(1-((x4+h2).^2./(a2^2))));

x5 = linspace(-7500,3030,100000);
y5 = -1*sqrt((b3^2).*(1-((x5+h3).^2./(a3^2))));

x3 = linspace(-3030,3030,10000);
y3 = sqrt(rc^2 - x3.^2);
y33 = -sqrt(rc^2 - x3.^2);

%initial geometry
ra1 = 1500;
rbra = 5;
rcra1 = 5.05;
rb1 = rbra*ra;
rc1 = rcra1*ra;
a21 = (ra1+rb1)/2;
a31 = (rb1+rc1)/2;
e21 = (rb1-ra1)/(rb1+ra1);
b21 = a21*sqrt(1-e21^2);
h21 = rb1-a21;
e31 = (rb1-rc1)/(rb1+rc1);
b31 = a31*sqrt(1-e31^2);
h31 = rb1-a31;

%obtaining trasfer curves
x11 = linspace(-1500,1500,10000);
y111 = sqrt((ra1^2)-x11.^2);
y1111 = -sqrt(ra1^2 - x11.^2);

x41 = linspace(-7500,1500,100000);
y41 = sqrt((b21^2).*(1-((x41+h21).^2./(a21^2))));

x51 = linspace(-7500,7575,100000);
y51 = -1*sqrt((b31^2).*(1-((x51+h31).^2./(a31^2))));

x31 = linspace(-7575,7575,10000);
y31 = sqrt(rc1^2 - x31.^2);
y331 = -sqrt(rc1^2 - x31.^2);

%plotting transfers
figure(3)
subplot(2,3,1)
hold on
plot(x1,y1,'color','b','LineStyle','--')
plot(x1,y11,'color','b')
plot(x4,y4)
plot(x5,y5)
plot(x3,y3,'color','k')
plot(x3,y33,'color','k')
title("rb/ra = 5 and rc/ra = 2.02")
legend('Initial','','Transfer 1','Transfer 2','Target')

%plotting transfers
subplot(2,3,4)
hold on
plot(x11,y111,'color','b','Linestyle','--')
plot(x11,y1111,'color','b')
plot(x41,y41)
plot(x51,y51)
plot(x31,y31,'color','k')
plot(x31,y331,'color','k')
title("rb/ra = 5 and rc/ra = 5.05")
legend('Initial','','Transfer 1','Transfer 2','Target')
axis([-10000 10000 -10000 10000])

% % % % % % % % % % % % % % 
%greater than 15.58

%process above entirely repeated but for different ratios
mu = 398600;
ra = 1500;
rbra = 30;
rcra = 7.07;
rb = rbra*ra;
rc = rcra*ra;
a2 = (ra+rb)/2;
a3 = (rb+rc)/2;
e2 = (rb-ra)/(rb+ra);
b2 = a2*sqrt(1-e2^2);
h2 = rb-a2;
e3 = (rb-rc)/(rb+rc);
b3 = a3*sqrt(1-e3^2);
h3 = rb-a3;

x1 = linspace(-1500,1500,10000);
y1 = sqrt((ra^2)-x1.^2);
y11 = -sqrt(ra^2 - x1.^2);

x4 = linspace(-45000,1500,100000);
y4 = sqrt((b2^2).*(1-((x4+h2).^2./(a2^2))));

x5 = linspace(-45000,10605,100000);
y5 = -1*sqrt((b3^2).*(1-((x5+h3).^2./(a3^2))));

x3 = linspace(-10605,10605,10000);
y3 = sqrt(rc^2 - x3.^2);
y33 = -sqrt(rc^2 - x3.^2);

ra1 = 1500;
rbra = 30;
rcra1 = 18.18;
rb1 = rbra*ra;
rc1 = rcra1*ra;
a21 = (ra1+rb1)/2;
a31 = (rb1+rc1)/2;
e21 = (rb1-ra1)/(rb1+ra1);
b21 = a21*sqrt(1-e21^2);
h21 = rb1-a21;
e31 = (rb1-rc1)/(rb1+rc1);
b31 = a31*sqrt(1-e31^2);
h31 = rb1-a31;

x11 = linspace(-1500,1500,10000);
y111 = sqrt((ra1^2)-x11.^2);
y1111 = -sqrt(ra1^2 - x11.^2);

x41 = linspace(-45000,1500,100000);
y41 = sqrt((b21^2).*(1-((x41+h21).^2./(a21^2))));

x51 = linspace(-45000,27270,100000);
y51 = -1*sqrt((b31^2).*(1-((x51+h31).^2./(a31^2))));

x31 = linspace(-27270,27270,10000);
y31 = sqrt(rc1^2 - x31.^2);
y331 = -sqrt(rc1^2 - x31.^2);
figure(3)
subplot(2,3,3)
hold on
plot(x1,y1,'color','b','Linestyle','--')
plot(x1,y11,'color','b')
plot(x4,y4)
plot(x5,y5)
plot(x3,y3,'color','k')
plot(x3,y33,'color','k')
title("rb/ra = 30 and rc/ra = 7.07")
legend('Initial','','Transfer 1','Transfer 2','Target')

subplot(2,3,6)
hold on
plot(x11,y111,'color','b','Linestyle','--')
plot(x11,y1111,'color','b')
plot(x41,y41)
plot(x51,y51)
plot(x31,y31,'color','k')
plot(x31,y331,'color','k')
title("rb/ra = 30 and rc/ra = 18.18")
legend('Initial','','Transfer 1','Transfer 2','Target')
axis([-50000 30000 -40000 30000])

%in between critical values
mu = 398600;
ra = 1500;
rbra = 11.94;
rcra = 2.02;
rb = rbra*ra;
rc = rcra*ra;
a2 = (ra+rb)/2;
a3 = (rb+rc)/2;
e2 = (rb-ra)/(rb+ra);
b2 = a2*sqrt(1-e2^2);
h2 = rb-a2;
e3 = (rb-rc)/(rb+rc);
b3 = a3*sqrt(1-e3^2);
h3 = rb-a3;

x1 = linspace(-1500,1500,10000);
y1 = sqrt((ra^2)-x1.^2);
y11 = -sqrt(ra^2 - x1.^2);

x4 = linspace(-17925,1500,100000);
y4 = sqrt((b2^2).*(1-((x4+h2).^2./(a2^2))));

x5 = linspace(-17925,3030,100000);
y5 = -1*sqrt((b3^2).*(1-((x5+h3).^2./(a3^2))));

x3 = linspace(-3030,3030,10000);
y3 = sqrt(rc^2 - x3.^2);
y33 = -sqrt(rc^2 - x3.^2);

ra1 = 1500;
rbra = 11.94;
rcra1 = 5.05;
rb1 = rbra*ra;
rc1 = rcra1*ra;
a21 = (ra1+rb1)/2;
a31 = (rb1+rc1)/2;
e21 = (rb1-ra1)/(rb1+ra1);
b21 = a21*sqrt(1-e21^2);
h21 = rb1-a21;
e31 = (rb1-rc1)/(rb1+rc1);
b31 = a31*sqrt(1-e31^2);
h31 = rb1-a31;

x11 = linspace(-1500,1500,10000);
y111 = sqrt((ra1^2)-x11.^2);
y1111 = -sqrt(ra1^2 - x11.^2);

x41 = linspace(-17925,1500,100000);
y41 = sqrt((b21^2).*(1-((x41+h21).^2./(a21^2))));

x51 = linspace(-17925,7575,100000);
y51 = -1*sqrt((b31^2).*(1-((x51+h31).^2./(a31^2))));

x31 = linspace(-7575,7575,10000);
y31 = sqrt(rc1^2 - x31.^2);
y331 = -sqrt(rc1^2 - x31.^2);
figure(3)
subplot(2,3,2)
hold on
plot(x1,y1,'color','b','Linestyle','--')
plot(x1,y11,'color','b')
plot(x4,y4)
plot(x5,y5)
plot(x3,y3,'color','k')
plot(x3,y33,'color','k')
title("rb/ra = 11.94 and rc/ra = 2.02")
legend('Initial','','Transfer 1','Transfer 2','Target')

subplot(2,3,5)
hold on
plot(x11,y111,'color','b','Linestyle','--')
plot(x11,y1111,'color','b')
plot(x41,y41)
plot(x51,y51)
plot(x31,y31,'color','k')
plot(x31,y331,'color','k')
title("rb/ra = 11.94 and rc/ra = 5.05")
legend('Initial','','Transfer 1','Transfer 2','Target')
axis([-20000 10000 -15000 10000])

end
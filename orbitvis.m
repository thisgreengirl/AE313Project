function orbitvis
%Generates velocity costs and orbit visualization
%   Program uses set values to generate the velocity cost and orbit
%   visualization for three different sets of radii ratio values

%for point in region for hohmann transfer
%initial values
mu = 398600;
ra = 1500;
rcra = 5;
rbra = 50;
rc = rcra*ra;
rb = rbra*ra;
a2 = (ra+rb)/2;
a3 = (rb+rc)/2;

%calculating velocity cost for bielliptic
vb1= sqrt((2*mu/ra)-(mu/a2)) - sqrt(mu/ra);
vb2 = sqrt((2*mu/rb)-(mu/a3)) - sqrt((2*mu/rb)-(mu/a2));
vb3 = sqrt((2*mu/rc)-(mu/a3)) - sqrt(mu/rc);
vba = abs(vb1)+ abs(vb2) + abs(vb3);

%calculating velocity cost for hohmann
ah = (ra+rc)/2;
vh1 = sqrt(((2*mu)/ra)-(mu/ah)) - sqrt(mu/ra);
vh2 = sqrt(mu/rc) - sqrt(((2*mu)/rc)-(mu/ah));
vha = abs(vh1) + abs(vh2);

%solving for some key geometry
e1 = (rc-ra)/(rc+ra);
b1 = ah*sqrt(1-e1^2);
h1 = rc-ah;

%displaying velocity cost to user
fprintf("The bielliptic velocity cost for an rc/ra of 5 and an rb/ra of 50 is %f\n",vba)
fprintf("The hohmann transfer velocity cost for an rc/ra of 5 and rb/ra of 50 is %f.\n",vha)

%obtaining curves for orbit transfer visualization hohmann
x1=linspace(-1500,1500,10000);
y1 = sqrt(ra^2 - x1.^2);
y11 = -sqrt(ra^2 - x1.^2);
x2 = linspace(-1500,7500,10000);
y2 = sqrt((b1^2).*(1-((x2-h1).^2./ah^2)));
x3 = linspace(-7500,7500,10000);
y3 = sqrt(rc^2 - x3.^2);
y33 = -sqrt(rc^2 - x3.^2);

%plotting hohmann transfer orbit visualization
figure(2)
subplot(2,3,1)
hold on
plot(x1,y1,'color','b', 'LineStyle','--')
plot(x1,y11,'Color','b','LineStyle','-')
plot(x2,y2,'Color','r')
plot(x3,y3,'Color','k','LineWidth',3)
plot(x3,y33,'Color','k','LineWidth',3)
legend('Initial','Initial','Transfer','Target','Target')
axis([-10000 10000 -10000 10000])
title("rc/ra=5 rb/ra=50")
hold off
% % % % % % % % % % % % % % % % 

%calculating initial geometry for bielliptic transfer visualization
e2 = (rb-ra)/(rb+ra);
b2 = a2*sqrt(1-e2^2);
h2 = rb-a2;
e3 = (rb-rc)/(rb+rc);
b3 = a3*sqrt(1-e3^2);
h3 = rb-a3;

%calculating curves for orbit visualization
x4 = linspace(-75000,1500,100000);
y4 = sqrt((b2^2).*(1-((x4+h2).^2./(a2^2))));

x5 = linspace(-75000,7500,100000);
y5 = -1*sqrt((b3^2).*(1-((x5+h3).^2./(a3^2))));

%plotting bielliptic transfer visualization
subplot(2,3,4)
hold on
plot(x1,y1,'color','b', 'LineStyle','--')
plot(x1,y11,'Color','b','LineStyle','-')
plot(x4,y4)
plot(x5,y5)
plot(x3,y3,'Color','k','LineWidth',3)
plot(x3,y33,'Color','k','LineWidth',3)
axis([-100000 10000 -25000 20000])
legend('Initial','Initial','Transfer','Transfer','Target','Target')
% % % % % % % % % % % % % % % 



% % % % % % % % % % % % % % % 

%For bielliptic area
%intitial values
mu = 398600;
ra = 1500;
rcra = 20;
rbra = 50;
rc = rcra*ra;
rb = rbra*ra;
a2 = (ra+rb)/2;
a3 = (rb+rc)/2;

%bielliptic velocity cost
vb1= sqrt((2*mu/ra)-(mu/a2)) - sqrt(mu/ra);
vb2 = sqrt((2*mu/rb)-(mu/a3)) - sqrt((2*mu/rb)-(mu/a2));
vb3 = sqrt((2*mu/rc)-(mu/a3)) - sqrt(mu/rc);
vba = abs(vb1)+ abs(vb2) + abs(vb3);

%hohmann velocity cost
ah = (ra+rc)/2;
vh1 = sqrt(((2*mu)/ra)-(mu/ah)) - sqrt(mu/ra);
vh2 = sqrt(mu/rc) - sqrt(((2*mu)/rc)-(mu/ah));
vha = abs(vh1) + abs(vh2);

%initial hohmann geometry
e1 = (rc-ra)/(rc+ra);
b1 = ah*sqrt(1-e1^2);
h1 = rc-ah;

%display velocity costs
fprintf("The bielliptic velocity cost for an rc/ra of 20 and an rb/ra of 50 is %f\n",vba)
fprintf("The hohmann transfer velocity cost for an rc/ra of 20 and rb/ra of 50 is %f.\n",vha)

%obtaining hohmann transfer curves
x1=linspace(-1500,1500,10000);
y1 = sqrt(ra^2 - x1.^2);
y11 = -sqrt(ra^2 - x1.^2);
x2 = linspace(-1500,30000,10000);
y2 = sqrt((b1^2).*(1-((x2-h1).^2./ah^2)));
x3 = linspace(-30000,30000,10000);
y3 = sqrt(rc^2 - x3.^2);
y33 = -sqrt(rc^2 - x3.^2);

%plotting hohmann transfer visualization
subplot(2,3,2)
hold on
plot(x1,y1,'color','b', 'LineStyle','--')
plot(x1,y11,'Color','b','LineStyle','-')
plot(x2,y2,'Color','r')
plot(x3,y3,'Color','k','LineWidth',3)
plot(x3,y33,'Color','k','LineWidth',3)
axis([-50000 50000 -50000 50000])
legend('Initial','Initial','Transfer','Target','Target')
title("rc/ra=20 and rb/ra=50")
hold off
% % % % % % % % % % % % % % % % 

%bielliptic geometry
e2 = (rb-ra)/(rb+ra);
b2 = a2*sqrt(1-e2^2);
h2 = rb-a2;
e3 = (rb-rc)/(rb+rc);
b3 = a3*sqrt(1-e3^2);
h3 = rb-a3;

%bielliptic curves
x4 = linspace(-75000,1500,100000);
y4 = sqrt((b2^2).*(1-((x4+h2).^2./(a2^2))));

x5 = linspace(-75000,30000,100000);
y5 = -1*sqrt((b3^2).*(1-((x5+h3).^2./(a3^2))));

%plotting bielliptic
subplot(2,3,5)
hold on
plot(x1,y1,'color','b', 'LineStyle','--')
plot(x1,y11,'Color','b','LineStyle','-')
plot(x4,y4)
plot(x5,y5)
plot(x3,y3,'Color','k','LineWidth',3)
plot(x3,y33,'Color','k','LineWidth',3)
legend('Initial','Initial','Transfer','Transfer','Target','Target')
% % % % % % % % % % % % % % % 



% % % % % % % % % % % % % % % 

%For final area
%initial values
mu = 398600;
ra = 1500;
rcra = 10;
rbra = 5;
rc = rcra*ra;
rb = rbra*ra;
a2 = (ra+rb)/2;
a3 = (rb+rc)/2;

%bielliptic velocity cost
vb1= sqrt((2*mu/ra)-(mu/a2)) - sqrt(mu/ra);
vb2 = sqrt((2*mu/rb)-(mu/a3)) - sqrt((2*mu/rb)-(mu/a2));
vb3 = sqrt((2*mu/rc)-(mu/a3)) - sqrt(mu/rc);
vba = abs(vb1)+ abs(vb2) + abs(vb3);

%hohmann velocity cost
ah = (ra+rc)/2;
vh1 = sqrt(((2*mu)/ra)-(mu/ah)) - sqrt(mu/ra);
vh2 = sqrt(mu/rc) - sqrt(((2*mu)/rc)-(mu/ah));
vha = abs(vh1) + abs(vh2);

%hohmann geometry
e1 = (rc-ra)/(rc+ra);
b1 = ah*sqrt(1-e1^2);
h1 = rc-ah;

%displaying velocity cost
fprintf("The bielliptic velocity cost for an rc/ra of 10 and an rb/ra of 5 is %f\n",vba)
fprintf("The hohmann transfer velocity cost for an rc/ra of 10 and rb/ra of 5 is %f.\n",vha)

%obtaining curves for hohmann
x1=linspace(-1500,1500,10000);
y1 = sqrt(ra^2 - x1.^2);
y11 = -sqrt(ra^2 - x1.^2);
x2 = linspace(-1500,15000,10000);
y2 = sqrt((b1^2).*(1-((x2-h1).^2./ah^2)));
x3 = linspace(-15000,15000,10000);
y3 = sqrt(rc^2 - x3.^2);
y33 = -sqrt(rc^2 - x3.^2);

%plotting hohmann transfer
subplot(2,3,3)
hold on
plot(x1,y1,'color','b', 'LineStyle','--')
plot(x1,y11,'Color','b','LineStyle','-')
plot(x2,y2,'Color','r')
plot(x3,y3,'Color','k','LineWidth',3)
plot(x3,y33,'Color','k','LineWidth',3)
legend('Initial','Initial','Transfer','Target','Target')
axis([-20000 20000 -20000 20000])
title('rc/ra=10 and rb/ra=50')
hold off
% % % % % % % % % % % % % % % % 

%bielliptic geometry
e2 = (rb-ra)/(rb+ra);
b2 = a2*sqrt(1-e2^2);
h2 = rb-a2;
e3 = (rb-rc)/(rb+rc);
b3 = a3*sqrt(1-e3^2);
h3 = rb-a3;

%curves for bielliptic transfer
x4 = linspace(-7500,1500,100000);
y4 = sqrt((b2^2).*(1-((x4+h2).^2./(a2^2))));

x5 = linspace(-7500,15000,100000);
y5 = -1*sqrt((b3^2).*(1-((x5+h3).^2./(a3^2))));

%plotting bielliptic transfer
subplot(2,3,6)
hold on
plot(x1,y1,'color','b', 'LineStyle','--')
plot(x1,y11,'Color','b','LineStyle','-')
plot(x4,y4)
plot(x5,y5)
plot(x3,y3,'Color','k','LineWidth',3)
plot(x3,y33,'Color','k','LineWidth',3)
legend('Initial','Initial','Transfer','Transfer','Target','Target')
end
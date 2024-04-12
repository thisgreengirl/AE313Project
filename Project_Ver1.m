%Hohmann Transfer vs Bielliptic Transfer
%Haley McKenzie


%NOTE: Figures will not generate properly if program is only run once. MUST run a
%second time without closing the figures to view proper figures

clear
clc

%intiializing variables for common use or for loops
ra = 3600;
v = 10.52;
rcra = linspace(0.5,30,60);
rbra = linspace(0.5,100,200);
mu = 398600;
i = 1;
j = 1;
k = 1;
p = 1;

%timing
tic
%for loop to constructthe velocitu values
for p=1:length(rcra)
    for i = 1:length(rbra)
        %determining intitial values for each ratio set like radii and
        %semi-major axis
        rc = rcra(p)*ra;
        rb = rbra(i)*ra;
        a2 = (ra+rb)/2;
        a3 = (rb+rc)/2;
        ah = (ra+rc)/2;

        %constructing line with equal radii
        if round(rb) == round(rc)
            m(j) = rcra(p);
            n(j) = rbra(i);
            j = j+1;
        end

        %velocity of the bielliptic tranfer separated to prevent human
        %error
        vb1(p,i) = sqrt((2*mu/ra)-(mu/a2)) - sqrt(mu/ra);
        vb2(p,i) = sqrt((2*mu/rb)-(mu/a3)) - sqrt((2*mu/rb)-(mu/a2));
        vb3(p,i) = sqrt((2*mu/rc)-(mu/a3)) - sqrt(mu/rc);
        vb(p,i) = abs(vb1(p,i)) + abs(vb2(p,i)) + abs(vb3(p,i));
        %extra variable of vbar for both calculated though not used
        vbbar(p,i) = sqrt((2*(rcra(p))+rbra(i))/(rcra(p)*rbra(i))) -((-1+sqrt(rcra(p)))/sqrt(rcra(p))) - (sqrt(2/(rbra(i)*(1+rbra(i))))*(1-rbra(i)));
        
        %velocity of hohman transfer
        vh1(p,i) = sqrt(((2*mu)/ra)-(mu/ah)) - sqrt(mu/ra);
        vh2(p,i) = sqrt(mu/rc) - sqrt(((2*mu)/rc)-(mu/ah));
        vh(p,i) = abs(vh1(p,i)) + abs(vh2(p,i));
        rt = sqrt(2);
        %extra variable of vbar for both calculated though not used
        vhbar(p,i) = (1/sqrt(rcra(p)))-((rt*(1-rcra(p)))/sqrt(rcra(p)*(1+rcra(p)))) -1;

        %finding points where the two velocity costs are equal (or close to
        %equal due to matlab constraints)
        if (abs(vb(p,i) - vh(p,i)) < 0.0005) && (round(rb)~=round(rc)) && rbra(i)~=1
            g(k) = rcra(p);
            h(k) = rbra(i);
            k = k+1;
        end
        i=i+1;
    end
    p = p+1;
end

%timing
toc

%creating points for the critical value lines
lowcritx = [11.94 11.94];
lowcrity = [0 100];
highcritx = [15.58 15.58];
highcrity = [0 100];

%points to fill in the graph, estimated
%bottom region
z = [0 30 30];
w = [0 0 30];
%right side region
q = [12 12.5 13 13.5 14.5 15.5 30 30];
o = [100 91.5 48.5 33.5 21.5 16 30 100];

%creating the first plot
figure(1)
hold on
subplot(1,2,1)
fill(z,w,'c')
fill(q,o,'m')
plot(g,h,'color','k')
plot(m,n,'color','k')
plot(lowcritx,lowcrity,'lineStyle','--','Color','r')
plot(highcritx,highcrity,'LineStyle','--','Color','r')
xlabel("rc/ra")
ylabel("rb/ra")
axis([0 30 0 100])

%timing
toc

%initial values for the second plot
rcra1 = linspace(0,100,100);
rbra1 = 5;
rbra2 = 11.94;
rbra3 = 15.58;
rbra4 = 20;
rbra5 = 30;
rbra6 = 50;
rbra7 = 100;
rbra8 = 1000000;
b = 1;

%for loop to find curves for second plot
for b=1:length(rcra1)
    %for rb/ra = 5
    rb1 = rbra1*ra;
    rc1 = rcra1(b)*ra;
    a21 = (ra+rb1)/2;
    a31 = (rb1+rc1)/2;
    vb11(b) = sqrt((2*mu/ra)-(mu/a21)) - sqrt(mu/ra);
    vb21(b) = sqrt((2*mu/rb1)-(mu/a31)) - sqrt((2*mu/rb1)-(mu/a21));
    vb31(b) = sqrt((2*mu/rc1)-(mu/a31)) - sqrt(mu/rc1);
    vbtot1(b) = (abs(vb11(b)) + abs(vb21(b)) + abs(vb31(b)))/v;

    %for rb/ra = 11.94
    rb2 = rbra2*ra;
    rc2 = rcra1(b)*ra;
    a22 = (ra+rb1)/2;
    a32 = (rb1+rc1)/2;
    vb12(b) = sqrt((2*mu/ra)-(mu/a22)) - sqrt(mu/ra);
    vb22(b) = sqrt((2*mu/rb2)-(mu/a32)) - sqrt((2*mu/rb2)-(mu/a22));
    vb32(b) = sqrt((2*mu/rc2)-(mu/a32)) - sqrt(mu/rc2);
    vbtot2(b) = (abs(vb12(b)) + abs(vb22(b)) + abs(vb32(b)))/v;
    

    %for rb/ra = 15.58
    rb3 = rbra3*ra;
    rc3 = rcra1(b)*ra;
    a23 = (ra+rb1)/2;
    a33 = (rb1+rc1)/2;
    vb13(b) = sqrt((2*mu/ra)-(mu/a23)) - sqrt(mu/ra);
    vb23(b) = sqrt((2*mu/rb3)-(mu/a33)) - sqrt((2*mu/rb3)-(mu/a23));
    vb33(b) = sqrt((2*mu/rc3)-(mu/a33)) - sqrt(mu/rc3);
    vbtot3(b) = (abs(vb13(b)) + abs(vb23(b)) + abs(vb33(b)))/v;


    %for rb/ra = 20
    rb4 = rbra4*ra;
    rc4 = rcra1(b)*ra;
    a24 = (ra+rb4)/2;
    a34 = (rb4+rc4)/2;
    vb14(b) = sqrt((2*mu/ra)-(mu/a24)) - sqrt(mu/ra);
    vb24(b) = sqrt((2*mu/rb4)-(mu/a34)) - sqrt((2*mu/rb4)-(mu/a24));
    vb34(b) = sqrt((2*mu/rc4)-(mu/a34)) - sqrt(mu/rc4);
    vbtot4(b) = (abs(vb14(b)) + abs(vb24(b)) + abs(vb34(b)))/v;

    %for rb/ra = 30
    rb5 = rbra5*ra;
    rc5 = rcra1(b)*ra;
    a25 = (ra+rb5)/2;
    a35 = (rb5+rc5)/2;
    vb15(b) = sqrt((2*mu/ra)-(mu/a25)) - sqrt(mu/ra);
    vb25(b) = sqrt((2*mu/rb5)-(mu/a35)) - sqrt((2*mu/rb5)-(mu/a25));
    vb35(b) = sqrt((2*mu/rc5)-(mu/a35)) - sqrt(mu/rc5);
    vbtot5(b) = (abs(vb15(b)) + abs(vb25(b)) + abs(vb35(b)))/v;

    %for rb/ra = 50
    rb6 = rbra6*ra;
    rc6 = rcra1(b)*ra;
    a26 = (ra+rb6)/2;
    a36 = (rb6+rc6)/2;
    vb16(b) = sqrt((2*mu/ra)-(mu/a26)) - sqrt(mu/ra);
    vb26(b) = sqrt((2*mu/rb6)-(mu/a36)) - sqrt((2*mu/rb6)-(mu/a26));
    vb36(b) = sqrt((2*mu/rc6)-(mu/a36)) - sqrt(mu/rc6);
    vbtot6(b) = (abs(vb16(b)) + abs(vb26(b)) + abs(vb36(b)))/v;

    %for rb/ra = 100
    rb7 = rbra7*ra;
    rc7 = rcra1(b)*ra;
    a27 = (ra+rb7)/2;
    a37 = (rb7+rc7)/2;
    vb17(b) = sqrt((2*mu/ra)-(mu/a27)) - sqrt(mu/ra);
    vb27(b) = sqrt((2*mu/rb7)-(mu/a37)) - sqrt((2*mu/rb7)-(mu/a27));
    vb37(b) = sqrt((2*mu/rc7)-(mu/a37)) - sqrt(mu/rc7);
    vbtot7(b) = (abs(vb14(b)) + abs(vb24(b)) + abs(vb34(b)))/v;

    %for rb/ra = 1000000 approx. infinity
    rb8 = rbra8*ra;
    rc8 = rcra1(b)*ra;
    a28 = (ra+rb8)/2;
    a38 = (rb8+rc8)/2;
    vb18(b) = sqrt((2*mu/ra)-(mu/a28)) - sqrt(mu/ra);
    vb28(b) = sqrt((2*mu/rb8)-(mu/a38)) - sqrt((2*mu/rb8)-(mu/a28));
    vb38(b) = sqrt((2*mu/rc8)-(mu/a38)) - sqrt(mu/rc8);
    vbtot8(b) = (abs(vb18(b)) + abs(vb28(b)) + abs(vb38(b)))/v;

    %hohmann transfer curve
    rch = rcra1(b)*ra;
    ah1 = (ra+rch)/2;
    vh11(b) = sqrt(((2*mu)/ra)-(mu/ah1)) - sqrt(mu/ra);
    vh21(b) = sqrt(mu/rch) - sqrt(((2*mu)/rch)-(mu/ah1));
    vhtot1(b) = (abs(vh11(b)) + abs(vh21(b)))/v;
    b = b+1;
end

%timing
toc

%creating points for the critical value lines
lowcritx = [11.94 11.94];
lowcrity = [0 1];
highcritx = [15.58 15.58];
highcrity = [0 1];

%creating the second plot with all curves
hold on
subplot(1,2,2)
plot(rcra1, vbtot1, 'color', 'c')
plot(rcra1,vbtot2, 'color','g')
plot(rcra1,vbtot3,'color','y')
plot(rcra1,vbtot4,'color','m')
plot(rcra1,vbtot5,'color','r')
plot(rcra1,vbtot6,'color','b')
plot(rcra1,vbtot7)
plot(rcra1,vbtot8)
plot(rcra1,vhtot1,'color','k')
plot(lowcritx,lowcrity,'lineStyle','--')
plot(highcritx,highcrity,'LineStyle','--')
legend('rb/ra = 5','rb/ra = 11.94','rb/ra = 15.58','rb/ra = 20','rb/ra = 30','rb/ra = 50','rb/ra = 100','rb/ra = infinity','Hohmann')
xlabel("rc/ra")
ylabel("Delta V/Va")
axis([0 100 0 1])

%timing
toc

%function for left side plots
orbitvis

%function for right side plots
turningpoints

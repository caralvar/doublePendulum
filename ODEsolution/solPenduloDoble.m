l = 1.0;
wo= 0.0;

ti=0;
dt=0.01;
tf=50;

time = ti:dt:tf;
Xo = [degtorad(120);degtorad(30);wo;wo];
[t,Y] = ode45(@penduloDoble,time,Xo);

cita1 = Y(:,1);
cita2 = Y(:,2);
w1 = Y(:,3);
w2 = Y(:,4);

x1 = l*sin(cita1);
y1 = -l*cos(cita1);

x2 = x1 + l*sin(cita2);
y2 = y1 - l*cos(cita2); 
z = zeros(size(x2));

T = linspace(ti,tf,numel(x2))';
figure;
surf([x1,x1],[y1,y1],[z,z]);
hold on;
surf([x2,x2],[y2,y2],[z,z],[T,T],'EdgeColor','flat');
xlabel('x');
ylabel('y');
c = colorbar;
ylabel(c,'t');

figure;
plot(t,w1);
hold on;
plot(t,w2);
title('Velocidades angulares en función del tiempo. \omega_o = 0.1 rad/s');
xlabel('t(s)');
ylabel('Velocidad angular [rad/s]')
legend('\omega_1(t)','\omega_2(t)');




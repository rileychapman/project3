function res = doublePen()

theda1Init = pi; %radians
thedaDot1Init = 0; %radians/sec
theda2Init = pi; %radians
thedaDot2Init = 0; %radians/sec
gdef = 9.81; %acceleration due to gravity
m1def = 1; %kilograms
m2def = 1; %kilograms
L1 = 2; %meters
L2 = 1; %meters


Minit = [theda1Init,thedaDot1Init,theda2Init,thedaDot2Init,gdef,m1def,m2def,L1,L2];

[t,M] = ode45(@diffeq, 0:60 , Minit);


function xdot = diffeq(t,x)
    %unpack
    theda1 = x(1);
    thedaDot1 = x(2);
    theda2 = x(3);
    thedaDot2 = x(4);
    g = x(5); 
    m1=x(6);
    m2=x(7); 
    l1=x(8); 
    l2=x(9);
    
    
    xdot=zeros(9,1);
    
    %the equations
    xdot(1) = x(2);
    
    xdot(2) = -((g*(2*m1+m2)*sin(x(1))+m2*(g*sin(x(1)-2*x(3))+2*(l2*x(4)^2+...
                l1*x(2)^2*cos(x(1)-x(3)))*sin(x(1)-x(3))))/...
                (2*l1*(m1+m2-m2*cos(x(1)-x(3))^2)));

    xdot(3) = x(4);
    
    xdot(4) = (((m1+m2)*(l1*x(2)^2+g*cos(x(1)))+l2*m2*x(4)^2*cos(x(1)-x(3)))*...
                sin(x(1)-x(3)))/(l2*(m1+m2-m2*cos(x(1)-x(3))^2));
    
    
end
end   
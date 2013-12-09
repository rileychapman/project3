function res = doublePen()
%initial conditions
theda1Init = pi-.4; %radians
thedaDot1Init = 0; %radians/sec
theda2Init = pi; %radians
thedaDot2Init = 0; %radians/sec
gdef = 9.81; %acceleration due to gravity
m1def = 1; %kilograms
m2def = 1; %kilograms
L1 = 2; %meters
L2 = 2; %meters


Minit = [theda1Init,thedaDot1Init,theda2Init,thedaDot2Init,gdef,m1def,m2def,L1,L2];

[t,M] = ode45(@diffeq, 0:80 , Minit);


plot_pendulum(t,M)

    function res = diffeq(t,x)
        %unpack
        g = x(5); 
        m1=x(6);
        m2=x(7); 
        l1=x(8); 
        l2=x(9);
       
        
        %the equations
        thetaDot1 = x(2);
        
        thetaDDot1 = -((g*(2*m1+m2)*sin(x(1))+m2*(g*sin(x(1)-2*x(3))+2*(l2*x(4)^2+...
                    l1*x(2)^2*cos(x(1)-x(3)))*sin(x(1)-x(3))))/...
                    (2*l1*(m1+m2-m2*cos(x(1)-x(3))^2)));

        thetaDDot2 = x(4);
        
        thetaDDot = (((m1+m2)*(l1*x(2)^2+g*cos(x(1)))+l2*m2*x(4)^2*cos(x(1)-x(3)))*...
                    sin(x(1)-x(3)))/(l2*(m1+m2-m2*cos(x(1)-x(3))^2));
                
        res = [thetaDot1;thetaDDot1;thetaDDot2;thetaDDot;0;0;0;0;0];        
                
    end

    function plot_pendulum(t,M)
        hold on;
        plot(t,M(:,1), 'b')
        plot(t,M(:,2), 'r')
        plot(t,M(:,3), 'g')
        plot(t,M(:,4), 'c')
        title('Double Pendulum', 'fontsize', 24)
        xlabel('time (seconds)', 'fontsize', 18)
        ylabel('radians or radians/sec', 'fontsize', 18q)
        legend('Theta1','Theta1Dot','Theta2','Theta2Dot')
    end

end   
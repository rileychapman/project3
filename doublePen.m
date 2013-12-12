function res = doublePen()
%initial conditions
theda1Init = -pi/3; %radians
thedaDot1Init = 0; %radians/sec
theda2Init = -pi/4; %radians
thedaDot2Init = -3; %radians/sec
g = -9.81; %acceleration due to gravity
m1 = 200; %kilograms
m2 = 100; %kilograms
L1 = 10; %meters
L2 = 3; %meters


Minit = [theda1Init,thedaDot1Init,theda2Init,thedaDot2Init];

[t,M] = ode45(@diffeq, 0:.001:30 , Minit);


x1 = L1 * sin(M(:,1));
y1 = L1 * cos(M(:,1));
x2 = x1 + L2* sin(M(:,3));
y2 = y1 + L2* cos(M(:,3));

W = projectiles(t,x2,y2);

animate(t,M,W);


%plot_pendulum(t,M)

    function res = diffeq(t,x)
      
       
        
        %the equations
        thetaDot1 = x(2);
        
        thetaDDot1 = -((g*(2*m1+m2)*sin(x(1))+m2*(g*sin(x(1)-2*x(3))+2*(L2*x(4)^2+...
                    L1*x(2)^2*cos(x(1)-x(3)))*sin(x(1)-x(3))))/...
                    (2*L1*(m1+m2-m2*cos(x(1)-x(3))^2)));

        thetaDot2 = x(4);
        
        thetaDDot2 = (((m1+m2)*(L1*x(2)^2+g*cos(x(1)))+L2*m2*x(4)^2*cos(x(1)-x(3)))*...
                    sin(x(1)-x(3)))/(L2*(m1+m2-m2*cos(x(1)-x(3))^2));
                
        res = [thetaDot1;thetaDDot1;thetaDot2;thetaDDot2];        
                
    end

    function W = projectiles(t,x2,y2)
        for i = 1:30:length(t)-2
            xVelInit = (x2(i+1) - x2(i))/.03;
            yVelInit = (y2(i+1) - y2(i))/.03;
            Vels = [x2(i), y2(i), xVelInit, yVelInit];
        
            [t,traj] = ode45(@trajectory, 1:.001:30, Vels);

            W(i) = [traj(:,1); traj(:,2)];

        end
    end

    function traj = trajectory(t,Vels)
        x = Vels(1);
        y = Vels(2);
        Vx = Vels(3);
        Vy = Vels(4);

        dxdt =  Vx;
        dydt = Vy;
        dVxdt = 0;
        dVydt = -9.81;

        traj = [dxdt;dydt;dVxdt;dVydt];
    end

    function plot_pendulum(t,M)
        hold on;
        plot(t,M(:,1), 'b')
        plot(t,M(:,2), 'r')
        plot(t,M(:,3), 'g')
        plot(t,M(:,4), 'c')
        title('Double Pendulum', 'fontsize', 24)
        xlabel('time (seconds)', 'fontsize', 18)
        ylabel('radians or radians/sec', 'fontsize', 18)
        legend('Theta1','Theta1Dot','Theta2','Theta2Dot')
    end

    function animate(t,M)

        %animate the pendulum
        
        for i = 1:30:length(t)-2
     
        clf;
        hold on;
        plot(x1(i),y1(i),'ro', 'Markersize', 12, 'MarkerFaceColor', 'r')
        plot(x2(i), y2(i), 'bo', 'Markersize', 12, 'MarkerFaceColor', 'b')
        line([0 x1(i)] ,[0 y1(i)]);
        line([x1(i) x2(i)], [y1(i) y2(i)]);
        xarrow = [x2(i), x2(i) + (x2(i+1)-x2(i))*150];
        yarrow = [y2(i), y2(i) + (y2(i+1)-y2(i))*150];
        plot(xarrow, yarrow)
        axis([-L1-L2-10 L1+L2+10 -L1-L2-10 L1+L2+10]);
        


        drawnow;
        end
        
        
        
    end


end   
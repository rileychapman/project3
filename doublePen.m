function res = doublePen(time, toAnimate, toValidate)

    %initial conditions
    theda1Init = -pi/3; %radians
    thedaDot1Init = 0; %radians/sec
    theda2Init = -pi/4; %radians
    thedaDot2Init = -3; %radians/sec
    g = -9.81; %acceleration due to gravity
    m1 = 200; %kilograms
    m2 = 100; %kilograms
    L1 = 10; %meters
    L2 = 5; %meters


    Minit = [theda1Init,thedaDot1Init,theda2Init,thedaDot2Init, g, m1, m2, L1, L2];
    
    options = odeset('RelTol', 1e-8);

    [t,M] = ode45(@diffeq, [0:.033:time] , Minit, options); 


    x1 = L1 * sin(M(:,1));
    y1 = L1 * cos(M(:,1));
    x2 = x1 + L2* sin(M(:,3));
    y2 = y1 + L2* cos(M(:,3));
    
    if toValidate == 1
        energy_val(t,m1, m2, L1, L2, M);
    end
    

    startPosX = x2(end);
    startPosY = y2(end);
    startVelX = L1 * M(end,2)*cos(M(end,1)) + L2 * M(end,4) * cos(M(end,3));
    startVelY = -L1 * M(end,2)*sin(M(end,1)) - L2 * M(end,4) * sin(M(end,3));
    shartPosX = x1(end);
    shartPosY = y1(end);
    shartVelX = L1 * M(end,2)*cos(M(end,1));
    shartVelY = -L1 * M(end,2)*sin(M(end,1));

    Derp= [startPosX; startPosY; startVelX; startVelY];
    Herp= [shartPosX; shartPosY; shartVelX; shartVelY];


    options2 = odeset('Events', @events, 'RelTol', 1e-8);

    function [value,isterminal,direction] = events(t,X)
        value = X(2) + 20; %extract the current distance
        isterminal = 1; %stop if the distance crosses 97
        direction = -1; %but only if the distance is increasing
    end

    [t2, M2] = ode45(@trajectory, 0:.033:50, Derp, options2);
    hold on
%     plot(x1, y1, 'r')
%     plot(x2, y2)1
%     plot(M2(:,1), M2(:,2), 'g')

    res = M2(end,1);

    %W = projectiles(t,x2,y2);
    
    if toAnimate == 1
        
        [t3, M3] = ode45(@diffeq, 0:.033:t2(end), M(end,:), options);
        
        x1s = L1 * sin(M3(:,1));
        y1s = L1 * cos(M3(:,1));
        x2s = x1s + L2* sin(M3(:,3));
        y2s = y1s + L2* cos(M3(:,3));
        
        W3 = [x1s, y1s, x2s, y2s];
        
        W = [x1, y1, x2, y2];
        animate(t, W, M2, W3);
    end
    


    %plot_pendulum(t,M)

        

%         function W = projectiles(t,x2,y2)
% 
% 
%             for i = 1:300:length(t)-2
%                 xVelInit = (x2(i+1) - x2(i))/.03;
%                 yVelInit = (y2(i+1) - y2(i))/.03;
%                 Vels = [x2(i), y2(i), xVelInit, yVelInit];
% 
%                 [t,traj] = ode45(@trajectory, t, Vels);
% 
%                 W{i,1} = traj(:,1); %x trajectory values
%                 W{i,2} = traj(:,2); %y trajectory values
% 
%             end
%         end


%         function plot_pendulum(t,M)
%             hold on;
%             plot(t,M(:,1), 'b')
%             plot(t,M(:,2), 'r')
%             plot(t,M(:,3), 'g')
%             plot(t,M(:,4), 'c')
%             title('Double Pendulum', 'fontsize', 24)
%             xlabel('time (seconds)', 'fontsize', 18)
%             ylabel('radians or radians/sec', 'fontsize', 18)
%             legend('Theta1','Theta1Dot','Theta2','Theta2Dot')
%         end

end   
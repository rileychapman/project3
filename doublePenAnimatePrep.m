function res = doublePenAnimatePrep(runTime, launchTime)
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

    [t,M] = ode45(@diffeq, [0:.001:runTime] , Minit);
    
    x1 = L1 * sin(M(:,1));
    y1 = L1 * cos(M(:,1));
    x2 = x1 + L2* sin(M(:,3));
    y2 = y1 + L2* cos(M(:,3));

    launchTimeIndex = launchTime * 1000;
    
    startPosX = x2(launchTimeIndex);
    startPosY = y2(launchTimeIndex);
    startVelX = L1 * M(launchTimeIndex,2)*cos(M(launchTimeIndex,1)) + L2 * M(launchTimeIndex,4) * cos(M(launchTimeIndex,3));
    startVelY = -L1 * M(launchTimeIndex,2)*sin(M(launchTimeIndex,1)) - L2 * M(launchTimeIndex,4) * sin(M(launchTimeIndex,3));

    Derp = [startPosX; startPosY; startVelX; startVelY];


    options = odeset('Events', @events);

    function [value,isterminal,direction] = events(t,X)
        value = X(2) + 20; %extract the current distance
        isterminal = 1; %stop if the distance crossesn something
        direction = -1; %but only if the distance is increasing
    end

    [t2, M2] = ode45(@trajectory, [0 50], Derp, options);
    
    
end
    
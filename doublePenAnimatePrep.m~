function res = doublePenAnimatePrep(launchTime)
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

    [t,M] = ode45(@diffeq, [0:.001:40] , Minit);
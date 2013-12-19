function res = energy_val(t,m1,m2,L1,L2,M)
    x1 = L1 * sin(M(:,1));
    y1 = L1 * cos(M(:,1));
    x2 = x1 + L2* sin(M(:,3));
    y2 = y1 + L2* cos(M(:,3));
    x1vel = diff(x1)/.033;
    y1vel = diff(y1)/.033;
    x2vel = diff(x2)/.033;
    y2vel = diff(y2)/.033;
    
    PE = ((m1*9.81*y1(2:end)) + (m2*9.81*y2(2:end)));
    KE = .5*m1*((x1vel(2:end).^2) + (y1vel(2:end).^2)) + .5*m2*((x2vel(2:end).^2) + (y2vel(2:end).^2));
    
    ME = PE + KE;
    
    plot(t,PE);
    plot(t,KE);
    plot(t,ME);
    
end

function res = diffeq(t,x)
            
            g = x(:,5);
            m1 = x(:,6);
            m2 = x(:,7);
            L1 = x(:,8);
            L2 = x(:,9);

            %the equations
            thetaDot1 = x(2);

            thetaDDot1 = -((g*(2*m1+m2)*sin(x(1))+m2*(g*sin(x(1)-2*x(3))+2*(L2*x(4)^2+...
                        L1*x(2)^2*cos(x(1)-x(3)))*sin(x(1)-x(3))))/...
                        (2*L1*(m1+m2-m2*cos(x(1)-x(3))^2)));

            thetaDot2 = x(4);

            thetaDDot2 = (((m1+m2)*(L1*x(2)^2+g*cos(x(1)))+L2*m2*x(4)^2*cos(x(1)-x(3)))*...
                        sin(x(1)-x(3)))/(L2*(m1+m2-m2*cos(x(1)-x(3))^2));

            res = [thetaDot1;thetaDDot1;thetaDot2;thetaDDot2,0,0,0,0,0];        

        end
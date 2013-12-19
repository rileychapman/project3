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
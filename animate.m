 function animate(t,W)

            %animate the pendulum
            
            x1 = W(:,1);
            y1 = W(:,2);
            x2 = W(:,3);
            y2 = W(:,4);


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
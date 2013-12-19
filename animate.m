 function animate(t,W, W2, W3)

            %animate the pendulum
            
            x1 = W(:,1);
            y1 = W(:,2);
            x2 = W(:,3);
            y2 = W(:,4);
            
            xproj = W2(:,1);
            yproj = W2(:,2);
            
            vectorArrowLength = 5;

            for i = 1:length(t)-2

            clf;
            hold on;
            plot(x1(i),y1(i),'go', 'Markersize', 12, 'MarkerFaceColor', 'g')
            plot(x2(i), y2(i), 'bo', 'Markersize', 12, 'MarkerFaceColor', 'b')
            line([0 x1(i)] ,[0 y1(i)]);
            line([x1(i) x2(i)], [y1(i) y2(i)]);
            xarrow = [x2(i), x2(i) + (x2(i+1)-x2(i))*vectorArrowLength];
            yarrow = [y2(i), y2(i) + (y2(i+1)-y2(i))*vectorArrowLength];
            plot(xarrow, yarrow, 'r')
            axis([-30 30 -20 30]);



            drawnow;
            end
            
            x1 = W3(:,1);
            y1 = W3(:,2);
            x2 = W3(:,3);
            y2 = W3(:,4);
            
            for i = 1:length(xproj)-2
                
            clf;
            hold on;
            plot(x1(i),y1(i),'go', 'Markersize', 6, 'MarkerFaceColor', 'g')
            plot(x2(i), y2(i), 'bo', 'Markersize', 6, 'MarkerFaceColor', 'b')
            line([0 x1(i)] ,[0 y1(i)]);
            line([x1(i) x2(i)], [y1(i) y2(i)]);
            xarrow = [x2(i), x2(i) + (x2(i+1)-x2(i))*vectorArrowLength];
            yarrow = [y2(i), y2(i) + (y2(i+1)-y2(i))*vectorArrowLength];
            plot(xarrow, yarrow, 'r')
            
            axis([-30 150 -20 140]);
            
            
              
          
            plot(xproj(i), yproj(i), 'ro', 'Markersize', 5, 'MarkerFaceColor', 'r');
            drawnow;
            
            
            
            end



        end
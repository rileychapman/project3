 function animate(t,W, W2, W3)

            %animate the pendulum
            
            fig1 = figure('Position',[100 100 960 720]);
            writerObj = VideoWriter('Launching.avi'); % video title and type
            writerObj.FrameRate = 30; % frames per second
            
            open(writerObj); % open video object
            set(gca,'nextplot','replacechildren'); % don't worry about this
            set(gcf,'Renderer','zbuffer'); % or this
            
            x1 = W(:,1);
            y1 = W(:,2);
            x2 = W(:,3);
            y2 = W(:,4);
            
            xproj = W2(:,1);
            yproj = W2(:,2);
            
            vectorArrowLength = 5;
            color = 255;

            for i = 1:length(t)-2
                tic

            clf;
            hold on;
            plot(x1(i),y1(i),'o', 'color', [18/color,125/color,9/color] , 'Markersize', 12, 'MarkerFaceColor', [18/color,125/color,9/color])
            plot(x2(i), y2(i), 'o', 'color', [18/color,125/color,9/color], 'Markersize', 12, 'MarkerFaceColor', [18/color, 125/color, 9/color]) 
            line([0 x1(i)] ,[0 y1(i)], 'color', [100/color, 255/color, 0/color], 'linewidth', 2);
            line([x1(i) x2(i)], [y1(i) y2(i)], 'color', [64/color, 255/color, 0/color], 'linewidth', 2);
            xarrow = [x2(i), x2(i) + (x2(i+1)-x2(i))*vectorArrowLength];
            yarrow = [y2(i), y2(i) + (y2(i+1)-y2(i))*vectorArrowLength];
            plot(xarrow, yarrow, 'r')
            axis([-20 20 -20 20]);
            axis square;
            
            title('Launching Tarzan','FontSize',18);
            xlabel('X (m)','FontSize', 15); ylabel('Y (m)','FontSize', 15);
            set(gca, 'FontSize', 13); 
            drawnow;
            timeTaken = toc;
            pause(.033-timeTaken);

            frame = getframe(fig1); % get each frame as the for loop runs
            writeVideo(writerObj,frame); % append each successive frame to the video object

            
            end
            
            x1 = W3(:,1);
            y1 = W3(:,2);
            x2 = W3(:,3);
            y2 = W3(:,4);
            
            for i = 1:length(xproj)-2
                tic
                
            clf;
            hold on;
            plot(x1(i),y1(i),'o', 'color', [18/color,125/color,9/color], 'Markersize', 6, 'MarkerFaceColor', [18/color,125/color,9/color])
            plot(x2(i), y2(i), 'o', 'color', [18/color,125/color,9/color], 'Markersize', 6, 'MarkerFaceColor', [18/color,125/color,9/color])
            line([0 x1(i)] ,[0 y1(i)], 'color', [100/color, 255/color, 0/color]);
            line([x1(i) x2(i)], [y1(i) y2(i)], 'color', [100/color, 255/color, 0/color]);
            xarrow = [x2(i), x2(i) + (x2(i+1)-x2(i))*vectorArrowLength];
            yarrow = [y2(i), y2(i) + (y2(i+1)-y2(i))*vectorArrowLength];
            plot(xarrow, yarrow, 'r')
            
            axis([-30 110 -20 110]);
            
            
            title('Launching Tarzan','FontSize',18);
            xlabel('X (m)','FontSize', 15); ylabel('Y (m)','FontSize', 15);
            set(gca, 'FontSize', 13); 

            
            
            
              
          
            plot(xproj(i), yproj(i), 'o', 'color', [77/color,38/color,0], 'Markersize', 5, 'MarkerFaceColor', [77/color,38/color,0]);
            drawnow;
            
            frame = getframe(fig1); % get each frame as the for loop runs
            writeVideo(writerObj,frame); % append each successive frame to the video object
            
            timeTaken = toc;
            pause(.033 - timeTaken);
            end

            close(writerObj);

        end
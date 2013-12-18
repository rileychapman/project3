resolution = 1000;
Dist = zeros([1, resolution]);
time = linspace(.5,30,resolution);
for i = 1:length(time)
	currentTime = time(i);
  	Dist(i) = doublePen(currentTime);
end
plot(time, Dist)
title('Distanced Launched', 'fontsize', 28)
xlabel('Time of Release (seconds)', 'fontsize', 15)
ylabel('Distance Traveled', 'fontsize', 15)

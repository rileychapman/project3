resolution = 100;
runTime = 40;
Dist = zeros([1, resolution]);
time = linspace(.5,runTime,resolution);
for i = 1:length(time)
	currentTime = time(i);
  	Dist(i) = doublePen(currentTime);
end

[topThrow, Index] = max(Dist);
topThrowTime = time(Index);

topThrowTime
topThrow


plot(time, Dist)
title('Distanced Launched', 'fontsize', 28)
xlabel('Time of Release (seconds)', 'fontsize', 15)
ylabel('Distance Traveled', 'fontsize', 15)
plot([0 runTime], [0 0], 'k-');
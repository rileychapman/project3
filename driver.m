toPunchline = 0;
resolution = 1000;
runTime = 60;
Dist = zeros([1, resolution]);
time = linspace(.5,runTime,resolution);
for i = 1:length(time)
	currentTime = time(i);
  	Dist(i) = doublePen(currentTime, 0, 0);
end

[topThrow, Index] = max(Dist);
topThrowTime = time(Index);

topThrowTime
topThrow

doublePen(topThrowTime, 1, 0); 

if toPunchline == 1
figure(2)
hold on;
plot(time, Dist)
title('Distanced Launched', 'fontsize', 28)
xlabel('Time of Release (seconds)', 'fontsize', 15)
ylabel('Distance Traveled', 'fontsize', 15)
plot([0 runTime], [0 0], 'k-');
end
Dist = zeros([50, 1]);
time = linspace(0,5,50);
for i = 1:length(time)
	currentTime = time(i);
  	Dist(i) = doublePen(time);
end
plot(time, Dist)
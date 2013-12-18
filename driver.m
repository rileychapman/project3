Dist = zeros([1, 100]);
time = linspace(.5,30,100);
for i = 1:length(time)
	currentTime = time(i);
  	Dist(i) = doublePen(currentTime);
end
plot(time, Dist)
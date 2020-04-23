#!/usr/bin/ion

fn setLatte
	if pgrep -x "latte-dock" > /dev/null
		sleep 7
		xdo raise -N lattedock
	else
		sleep 1
		setLatte
	end
end

# detects if latte is in window rather than process is running 
# Should be more accurate and 
#fn setLatte
#	if test $(xdotool search --onlyvisible --class 'lattedock' | wc -l) -gt 0
#		sleep 1
#		xdo raise -N lattedock
#	else
#		sleep 1
#		setLatte
#	end
#end

setLatte

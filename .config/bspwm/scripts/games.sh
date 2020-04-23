#!/usr/bin/ion

#let desktops = [ @(fd --base-directory ~/.local/share/applications -e desktop -a) ]
let games = [ ]

for game in @lines($(rg steam ~/.local/share/applications -l --trim))
  let gameName = $(rg Name "${game}" -N)
  let games ++= [ $gameName[5..] ] 
	#if test $(rg steam "${app}" | wc -l) -gt 0
    #    echo "$app is game"
    #end 
end

fn checkGaming
  for game in @games
    if test $(ps aux | rg "$game" | wc -l) -gt 1
      killall picom
    else
      if pgrep -x "picom" > /dev/null
        :
      else
        picom -b --experimental-backends
      end
    end
  end
end

checkGaming
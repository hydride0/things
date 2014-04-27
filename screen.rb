#!/usr/bin/env ruby
# screenfetch clone for Arch

class String
	def xtr(hash)
		self.match(/(.+):(.+)/) { |m| hash.store( m[1].strip, m[2].strip ) }
		return hash
	end
end

require 'colorb'

info = {}
`cat /proc/cpuinfo | grep 'model name'`.strip.xtr(info)
`xdpyinfo | grep 'dimensions'`.strip.xtr(info)
`wmctrl -m | grep 'Name'`.strip.xtr(info)

puts "                   -`".cyan
puts "                  .o+`                 ".cyan + "Host: ".cyan + `hostname`
puts "                 ´ooo/                 ".cyan + "OS: ".cyan + `lsb_release -si`
puts "                ´xoooo:                ".cyan + "Kernel: ".cyan + `uname -sr`
puts "               ´xoooooo:               ".cyan + "Uptime: ".cyan + `uptime -p`
puts "               -xoooooo+:              ".cyan + "WM: ".cyan + info["Name"]
puts "             ´/:-:++oooo+:             ".cyan + "Shell: ".cyan + `echo $SHELL`
puts "            ´/++++/+++++++:            ".cyan + "Editor: ".cyan + `echo $EDITOR`
puts "           ´/++++++++++++++:           ".cyan + "CPU: ".cyan + info["model name"]
puts "          ´/+++ooooooooooooo/`         ".cyan + "Architecture: ".cyan + `uname -m`
puts "         ./ooosssso++osssssso+`        ".cyan + "Resolution: ".cyan + info["dimensions"]
puts "        .oossssso-````/ossssss+`       ".color(45)
puts "       -osssssso.      :ssssssso.      ".color(45)
puts "      :osssssss/        osssso+++.     ".color(45)
puts "     /ossssssss/        +ssssooo/-     ".color(45)
puts "   ´/ossssso+/:-        -:/+osssso+-   ".color(45)
puts "  ´+sso+:-`                 `.-/+oso:  ".color(45)
puts " ´++:.                           `-/+/ ".color(45)
puts " .`                                 `/ ".color(45)

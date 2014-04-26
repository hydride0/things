# screenfetch clone for Arch

class String
	def to(col)
		self.color(col).bold
	end
  
	def xtr(hash)
		self.match(/(.+):(.+)/) {|m| hash.store( m[1].strip, m[2].strip) }
		return hash
	end
end

require 'colorb'

info = {}
`cat /proc/cpuinfo`.each_line { |line| line.strip.xtr(info) }
`xdpyinfo | grep 'dimensions'`.strip.xtr(info)
`wmctrl -m | grep 'Name'`.strip.xtr(info)

puts "                   -`".to(:cyan)
puts "                  .o+`                 ".to(:cyan) + "Host: ".to(:cyan) + `hostname`
puts "                 ´ooo/                 ".to(:cyan) + "Kernel: ".to(:cyan) +`uname -sr`
puts "                ´xoooo:                ".to(:cyan) + "OS: ".to(:cyan) + `lsb_release -si`
puts "               ´xoooooo:               ".to(:cyan) + "Uptime: ".to(:cyan) + `uptime -p`
puts "               -xoooooo+:              ".to(:cyan) + "Editor: ".to(:cyan) + `echo $EDITOR`
puts "             ´/:-:++oooo+:             ".to(:cyan) + "Shell: ".to(:cyan) + `echo $SHELL`
puts "            ´/++++/+++++++:            ".to(:cyan) + "CPU: ".to(:cyan) + info["model name"]
puts "           ´/++++++++++++++:           ".to(:cyan) + "Resolution: ".to(:cyan) + info["dimensions"]
puts "          ´/+++ooooooooooooo/`         ".to(:cyan) + "WM: ".to(:cyan) + info["Name"]
puts "         ./ooosssso++osssssso+`        ".to(:cyan)
puts "        .oossssso-````/ossssss+`       ".to(45)
puts "       -osssssso.      :ssssssso.      ".to(45)
puts "      :osssssss/        osssso+++.     ".to(45)
puts "     /ossssssss/        +ssssooo/-     ".to(45)
puts "   ´/ossssso+/:-        -:/+osssso+-   ".to(45)
puts "  ´+sso+:-`                 `.-/+oso:  ".to(45)
puts " ´++:.                           `-/+/ ".to(45)
puts " .`                                 `/ ".to(45)
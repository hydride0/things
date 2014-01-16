#!/usr/bin/env ruby
ARGV.each {|arg| system "ffmpeg -i '#{arg}' -c:a libopus -b:a 150k '#{arg.gsub('flac', 'opus')}'"}

#EXAMPLE
#
#  $ ruby opus.rb '02 - Overture No. 4.flac' '03 - Time Changer.flac' '04 - Jayda.flac'
#  $ ls *.opus
#  $ 02 - Overture No. 4.opus  03 - Time Changer.opus  04 - Jayda.opus
# 

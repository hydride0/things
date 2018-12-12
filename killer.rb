#!/usr/bin/env ruby

blacklist = ["firefox", "mocp", "chromium"]

loop do
    blacklist.each do |process|
        if ( system "pgrep -x #{process} > /dev/null" )
            system "killall #{process}"
        end
        sleep(1)
    end
end

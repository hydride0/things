require 'rss'
require 'open-uri'
require 'colorb'
require 'googl'



url = []
File.read('rss.txt').each_line { |line| url << line.strip }
# rss.txt contains rss urls, one per line. You could also rename it if you don't like its name
url.each do |url| 
	open(url) do |rss|
		feed = RSS::Parser.parse(rss)
		puts "\t\t\t#{feed.channel.title}\n\n".color(:cyan).bold
		feed.items.each do |item|
			puts "#{item.title.color(:white).bold}\n#{Googl.shorten(item.link).short_url}\n\n"
		end
	end
end

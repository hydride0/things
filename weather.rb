#!/usr/bin/env ruby
#
require 'json'
require 'open-uri'
require 'colorb'

if ARGV[0].include?' '
	ARGV[0] = ARGV[0].gsub(' ', '+')
end

json_file = "http://api.openweathermap.org/data/2.5/weather?q=#{ARGV[0]}"

parsed = JSON.parse open(json_file).read

icon = case parsed["weather"][0]["main"]
when "Clouds"       then '☁'.color(243)
when "Thunderstorm" then '⚡'.color(226)
when "Rain"         then '☔'.color(124)
when "Clear"        then '☀'.color(226)
when "Snow"         then '❄'.color(159)
when "Haze"         then '▒'.color(231)
end

puts "#{parsed['name']} (#{parsed['sys']['country']}) #{icon}" 
puts "#{parsed['weather'][0]['main']} (#{parsed['weather'][0]['description']}), #{(parsed['main']['temp'].to_i - 270).to_s}°C"
puts "Sun rises at #{Time.at(parsed['sys']['sunrise']).strftime('%I:%M%p')}"
puts "Sun sets at #{Time.at(parsed['sys']['sunset']).strftime('%I:%M%p')}"

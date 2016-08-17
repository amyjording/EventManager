require 'csv'

puts "EventManager Initialized!"

time = []

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

contents.each do |row|

time << row[:regdate]

end

result = Hash[time.group_by { |t| DateTime.strptime(t, '%m/%d/%Y %H:%M').hour }.map{|k,v| [k, v.length]}]
weekday = Hash[time.group_by { |t| DateTime.strptime(t, '%m/%d/%Y %H:%M').wday }.map{|k,v| [k, v.length]}]

puts result
print weekday

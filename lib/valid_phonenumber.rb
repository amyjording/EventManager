require 'csv'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, "0")[0..4]
end

def valid_phone_number(phonenumber)

  phonenumber = phonenumber.gsub(/\W/, '')

  if phonenumber.length > 10 && phonenumber[0] == 1
    phonenumber = phonenumber[1..12]
  elsif phonenumber.length != 10
    "Invalid Number"
  else
    phonenumber
  end
end

puts "EventManager Initialized!"

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  phonenumber = valid_phone_number(row[:homephone])
  zipcode = clean_zipcode(row[:zipcode])
  date = DateTime.strptime(row[:regdate],'%m/%d/%y %H:%M').hour

  puts "#{name}, #{phonenumber}, #{zipcode} Registered at this hour: #{date} "

end

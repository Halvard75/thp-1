puts "Conditions !"

puts "----"

a = 15
puts "a est égal à : #{a}"
if a > 10
	puts "A est supérieur à 10"
else
	puts "A est inférieur à 10"
end


puts "----"

emails = [
	"bob@bob.com", 
	"jane@hello.com"
]

if emails.size == 1
	puts "J'ai un email"
else
	puts "J'ai plus ou moins un email"
end

puts "----"

emails = [
	"bob@bob.com", 
	"jane@hello.com"
]
 emails.each do |email|
 	puts email
 	if email == "bob@bob.com"
 		puts "Bonjour Bob !"
 	else 
 		puts "Vous n'êtes pas Bob"
 		end
 end


puts "----"

a = 10
if (a == 12 || a == 10) && a !="Hello"
	puts "Okay !"
end

puts "----"
a = 5
mon_booleen = (a >10)
puts mon_booleen

if mon_booleen
	puts "Okay !"
end




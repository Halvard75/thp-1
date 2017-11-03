puts "essai n°1"

require 'rspec'

def greater_than_10 arr
	arr.count do |e|
		e > 10
	end
end

describe 'Array counter' do 
	it 'couts how many elements are greater than 10' do
	arr = [100,2, 5, 10, 11]
	expect(greater_than_10 arr).to eq(2)
	end	
end

arr = [500, 25, 100, 2, 5, 10, 11]
greater_than_10 arr

puts "essai n°2"
puts "Je vais compter de 1 a 1000"
i = 0
while (i < 1000)
  i += 1
  puts i
end

puts "essai n°3"

def mymultiple(n)
  (0..n).each { |n|
    if (n % 3 == 0) && (n % 5 == 0)
      puts "Multiple de 3 & 5"
    elsif n % 3 == 0
      puts "Multiple de 3"
    elsif n % 5 == 0 
      puts "Multiple de 5"
    else
      puts n
    end
  }
end
 
mymultiple(1000)

puts "essai n°4"

first_name = "Adam"
last_name = "Ross"
full_name = "#{first_name} #{last_name}"
puts full_name
t = full_name.size
v = full_name.count("aeiou")
c = (t -v)
puts "#{t} & #{v} & #{c}"

puts "essai n°5"

loop do 
	entree = gets

	if !entree.match(/^([0-9]+)$/)
		puts "pas positif"
	elseif entree.to_i > 50
		puts "> 50"
else
	break
end
end

puts "essai n°6"
ary = [1, 2, 4, 2]
ary.count               #=> 4
ary.count(2)            #=> 2
ary.count{ |x| x%2==0 } #=> 3

puts "essai n°7"
#1 je défini les multiples de 3 et 5


def monmultiple(n)
  (1..n).each { |n|
    if (n % 3 == 0) && (n % 5 == 0) 
      #puts "Multiple de 3 & 5"
    elsif (n % 3 == 0)
      #puts "Multiple de 3"
    elsif (n % 5 == 0) 
      #puts "Multiple de 5"
    else
      #puts n
    end
  }
end
 
#2 je veux jusqu'à 1000 non inclus
monmultiple(999)
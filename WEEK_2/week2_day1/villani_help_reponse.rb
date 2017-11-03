puts "\n Résultat : "
nombre = (1..999)

n = nombre.count
  puts "Nombre de chiffres pris en compte : #{n}"

m3 = nombre.count{ |x| x%3==0 } 
  puts "Multiple de 3 : #{m3}"

m5 = nombre.count{ |x| x%5==0 } 
  puts "Multiple de 5 : #{m5}"
m15 = nombre.count{ |x| x%15==0 } 
  puts "Multiple de 3 et 5 (soit 15) : #{m15}"

a=0
nombre.each do |x|
  if (x%3) == 0 || (x%5) == 0
  #print x
  a+= x
  end
end
  puts "La somme de ces nombres est égale à : #{a}"
class Utilisateur
  attr_accessor :prenom, :nom, :pays

	def nom_complet
		prenom + " " + nom 
	end

	def habite_en(valeur)
			valeur == pays
	end
end


bob = Utilisateur.new
bob.prenom = "Bob"
bob.nom = "Lenon"
bob.pays = "France"

puts "n°1"
puts bob.prenom + " " + bob.nom
puts ""

puts "n°2"
nom_complet = bob.prenom + " " + bob.nom
puts nom_complet
puts ""

puts "n°3"
puts bob.nom_complet
puts ""

puts "n°4"
puts "Est-ce que Bob habite en France ?"
puts bob.habite_en("France")
puts ""

puts "n°5"
if bob.habite_en("Suisse")
	puts "Bonjour cher ami Suisse!"
else
	puts "Tu n'es pas Suisse !"
end
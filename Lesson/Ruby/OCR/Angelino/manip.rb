class Utilisateur
 attr_accessor :prenom, :ami, :amis

 	def prenom_ami
		prenom + " est ami avec " + ami
	end

 	def est_ami_avec(valeur)
 		valeur == ami
	end	

	def est_amis_avec(prenom)
		amis.each do |ami|
		return true	if ami.prenom == prenom 
			end
			return false
		end
	

	def initialize (prenom)
		@prenom = prenom
		puts "Bonjour depuis initialize"
	end

end

alice = Utilisateur.new("Alice")
alice.ami = "bob"
puts alice.prenom
puts alice.prenom_ami

puts "Est-ce que Alice est ami avec Bob ?"
if alice.est_ami_avec("bob")
	puts "C'est mon pote"
else
	puts "C'est qui celui la"
end

puts "Qui est l'ami d'" + alice.prenom + "?"
puts alice.ami




puts ""

bob = Utilisateur.new
bob.prenom = "Bob"
bob.ami = "alice"
puts bob.prenom_ami


puts ""

jane = Utilisateur.new
jane.prenom = "Jane"
jane.ami = "personne"
puts jane.prenom_ami


puts ""


alice.amis = [bob, jane]
puts alice.amis.reverse
puts alice.amis.size
puts alice.amis


bob.amis = [alice]

jane.amis = [alice]

puts alice.est_amis_avec("bob")
puts bob.est_amis_avec("jane")




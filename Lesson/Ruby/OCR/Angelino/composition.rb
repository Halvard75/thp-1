class Eleve
  attr_accessor :nom, :examens
  def moyenne 
  	total = 0
  	examens.each do |examen|
  		total += examen.note
  	end
  	total / examens.size
  end
end

class Examen
  attr_accessor :nom, :note
  
  def initialize(nom,note)
    @nom = nom
    @note = note
  end
end

mon_eleve = Eleve.new
mon_eleve.nom = "Billy"

maths = Examen.new("maths", 10.0)
philo = Examen.new("philo", 15.0)

mon_eleve.examens = [maths, philo]

puts "Examens de #{mon_eleve.nom}"
mon_eleve.examens.each do |examen|
	puts examen.nom
	end

puts mon_eleve.moyenne



class Utilisateur
 attr_accessor :tous_ses_amis
end

utilisateur = Utilisateur.new
utilisateur.tous_ses_amis = "Jane"
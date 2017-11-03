require 'sinatra'

class BoardCase
  attr_accessor :value, :full

  def initialize(ligne,colonne)
    @value = " "
    @full = false
  end
end

class Board
  attr_accessor :fin_jeu, :case17, :case18, :case19, :case27, :case28, :case29, :case37, :case38, :case39

  def initialize
    @fin_jeu = false
    @fin_jeu_car = " "
    @case17 = BoardCase.new(1,7)
    @case18 = BoardCase.new(1,8)
    @case19 = BoardCase.new(1,9)
    @case27 = BoardCase.new(2,7)
    @case28 = BoardCase.new(2,8)
    @case29 = BoardCase.new(2,9)
    @case37 = BoardCase.new(3,7)
    @case38 = BoardCase.new(3,8)
    @case39 = BoardCase.new(3,9)
  end

  def ligne_rempli_ou_pas(pion)

    bande_rempli = false
    remplissage = [pion, pion, pion]


    ligne_rempli = ([case17.value, case18.value, case19.value] == remplissage || [case27.value, case28.value, case29.value] == remplissage || [case37.value, case38.value, case39.value] == remplissage)

    colonne_rempli = false
    colonne_rempli = ([case17.value, case27.value, case37.value] == remplissage || [case18.value, case28.value, case38.value] == remplissage || [case19.value, case29.value, case39.value] == remplissage)

    diagonalegd_rempli = false
    diagonalegd_rempli = ([case17.value, case28.value, case39.value] == remplissage)

    diagonaledg_rempli = false
    diagonaledg_rempli = ([case19.value, case28.value, case37.value] == remplissage)

    bande_rempli = (ligne_rempli || colonne_rempli || diagonalegd_rempli|| diagonaledg_rempli)
    bande_rempli
  end

  def tableau_rempli_ou_pas
    tableau_rempli = false
    if (case17.value != " ") && (case18.value != " ") && (case19.value != " ") && (case27.value != " ") && (case28.value != " ") && (case29.value != " ") && (case37.value != " ") && (case38.value != " ") && (case39.value != " ")
      tableau_rempli = true
    end
    tableau_rempli
  end

  def grille
    puts "\n-----  🕹  -----"

    puts "\n#{@case17.value}  |  #{@case18.value}  |  #{@case19.value}"
    puts "----------------"
    puts "#{@case27.value}  |  #{@case28.value}  |  #{@case29.value}"
    puts "----------------"
    puts "#{@case37.value}  |  #{@case38.value}  |  #{@case39.value}"

  end

  def case_rempli_ou_pas(case_ligne,case_colonne)
    if eval("case#{case_ligne}#{case_colonne}.full == true")
      return true
    else return false
    end
  end

  def maj_case(case_ligne,case_colonne,pion)
    eval("@case#{case_ligne}#{case_colonne}.value = pion")
    eval("@case#{case_ligne}#{case_colonne}.full = true")
  end
end

class Player
  attr_accessor :nom, :pion
  def initialize
    puts "\nMerci de renseigner ton pseudo"
    a= gets.chomp
    @nom = a
    @gagnant = false
    @pion = ""
  end

  def coup
    puts "\n#{nom}, à ton tour de placer un pion"

    puts "\nChoix de ligne => (1 = haut), (2 = milieu), (3 = bas)"
    case_ligne = gets.chomp.to_i
    case case_ligne
    when 1..3
      puts ""
    else puts "\n2eme chance : Choix de ligne => (1 = haut), (2 = milieu), (3 = bas)"
      case_ligne = gets.chomp.to_i
    end

    puts "\nChoix de colonne => (7 = gauche), (8 = milieu), (9 = droite)"
    case_colonne = gets.chomp.to_i
    case case_colonne
    when 7..9
      puts ""
    else puts "\n2emeChoix de colonne => (7 = gauche), (8 = milieu), (9 = droite)"
      case_colonne = gets.chomp.to_i
    end

    return [case_ligne,case_colonne]
  end


  def choix_pion(pions)
    @pion = pions
  end
end

class Game
  attr_accessor :nom_jeu, :grille1, :joueur1, :joueur2

  def initialize(nom_du_jeu)
    @nom_jeu = nom_du_jeu
    @grille1 = Board.new
    puts "Ca va taper un petit morpion des familles\n"
    print "\nPremier joueur, tu auras les croix"
    @joueur1 = Player.new
    joueur1.choix_pion("❌")
    print "\nDeuxième joueur, tu auras les cercles"
    @joueur2 = Player.new
    joueur2.choix_pion("⭕️")

    debut_partie
  end

  def jeu_en_cours

    fin_jeu_car = ""

    if grille1.ligne_rempli_ou_pas("❌")
      @grille1.fin_jeu = true
      fin_jeu_car = "\nBIM Victoire de #{joueur1.nom} !!!"
      grille1.grille

    elsif grille1.ligne_rempli_ou_pas("⭕️")
      @grille1.fin_jeu = true
      fin_jeu_car = "\nBIM Victoire de #{joueur2.nom} !!!"
      grille1.grille

    elsif grille1.tableau_rempli_ou_pas
      @grille1.fin_jeu = true
      fin_jeu_car = "\nEx Aequo "
      grille1.grille
    end

    puts fin_jeu_car
    @grille1.fin_jeu
  end

  def debut_partie
    until grille1.fin_jeu == true
      grille1.grille
      decision = joueur1.coup
      while grille1.case_rempli_ou_pas(decision[0],decision[1])
        puts "\nTu ne vois pas que c'est déjà rempli !!!\n"
        grille1.grille
        decision = joueur1.coup
      end

      grille1.maj_case(decision[0],decision[1], joueur1.pion)
      jeu_en_cours

      if grille1.fin_jeu != true
        grille1.grille
        decision = joueur2.coup
        while grille1.case_rempli_ou_pas(decision[0],decision[1])
          puts "\nTu ne vois pas que c'est déjà rempli !!!\n"
          grille1.grille
          decision = joueur2.coup
        end
        grille1.maj_case(decision[0],decision[1], joueur2.pion)
        jeu_en_cours
      end
    end
  end
end

morpion = Game.new("Morpion")

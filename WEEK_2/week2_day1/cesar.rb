expression = "What a string !"
	ascii = expression.chars.map(&:ord)
		puts expression
		#puts ascii
	
	chiffrement = 5
	shifted = ascii.map { |c| c + chiffrement }
		#puts shifted

	code = shifted.map { |c| c.chr }.join
	puts "\n #{code}"

deedxpression = code
	ascii = deexpression.chars.map(&:ord)
		puts deexpression
		#puts ascii	

	chiffrement = -5
	deshifted = ascii.map { |c| c + chiffrement }
		#puts shifted

	decode = deshifted.map { |c| c.chr }.join
	puts "\n #{decode}"


def trader_du_dimanche (array)
	nombre_de_jours_de_marche = array.length 		#date de marché ouvert
	etudes_scenarii=[] 								#chaque prix.jour vente - prix.jour achat = +- value
	(0..(nombre_de_jours_de_marche-2)).each do |x| 	#test des jours d'achat en fonction du meilleur scenar. pas de vente le jour meme d'achat
	etude_scenario = {
			'achat_le' =>x, 'au_prix_achat' => array[x],'et_jour_vente' => x,'avec_prix_vente' => array[x], 'pour_plus_value' => 0
		}
		((x+1)..(nombre_de_jours_de_marche-1)).each do |y| #itération pour trouver le meilleur
			if array[y]-array[x] > etude_scenario['pour_plus_value']
				etude_scenario['et_jour_vente'] = y
				etude_scenario['avec_prix_vente'] = array[y]
				etude_scenario['pour_plus_value'] = array[y]-array[x]
			end
		end
		etudes_scenarii << etude_scenario     #soit
	end

	achat_potentiel=[0,0] #achat selon plus value
	etudes_scenarii.each do |z|
		if z['pour_plus_value'] > achat_potentiel[1]
			achat_potentiel[0] = z['achat_le']
			achat_potentiel[1] = z['pour_plus_value']
		end
	end

	puts etudes_scenarii[achat_potentiel[0]]

end

def trader_du_lundi (array_de_hash)
	entreprises = array_de_hash[0].keys 				#tableau avec chaque entreprise
	nombre_de_jours_de_marche = array_de_hash.length 	#date de marché ouvert
	entreprises.each do |e| 							#entreprise avec leurs valeurs
	 	valeurs_entreprise = []
	 	tableau_valeurs_jour = {}
	 	(0..(nombre_de_jours_de_marche-1)).each do |x|
	 		valeurs_entreprise << array_de_hash[x][e]
	 		puts "Pour #{e} :"
			trader_du_dimanche(valeurs_entreprise)
	 	end
	end
end


trader_du_dimanche([17,3,6,9,15,8,6,1,10])
trader_du_lundi ([
	{:GOO => 15, :MMM => 14, :ADBE => 12, :EA=> 13, :BA => 8, :KO => 10, :XOM => 20, :GPS => 7, :MCD => 11, :DIS => 15, :CRM => 6, :JNJ => 10 },
	{ :GOO => 8, :MMM => 20, :ADBE => 3, :EA=> 10, :BA => 5, :KO => 19, :XOM => 12, :GPS => 6, :MCD => 15, :DIS => 9, :CRM => 10, :JNJ => 17 },
	{ :GOO => 3, :MMM => 8, :ADBE => 15, :EA=> 5, :BA => 10, :KO => 5, :XOM => 15, :GPS => 13, :MCD => 10, :DIS => 18, :CRM => 5, :JNJ => 14 },
	{ :GOO => 17, :MMM => 3, :ADBE => 6, :EA=> 9, :BA => 15, :KO => 6, :XOM => 8, :GPS => 1, :MCD => 10, :DIS => 15, :CRM => 18, :JNJ => 3 },
	{ :GOO => 8, :MMM => 18, :ADBE => 4, :EA=> 6, :BA => 15, :KO => 18, :XOM => 3, :GPS => 12, :MCD => 19, :DIS => 3, :CRM => 7, :JNJ => 9 },
	{ :GOO => 10, :MMM => 12, :ADBE => 8, :EA=> 3, :BA => 18, :KO => 20, :XOM => 5, :GPS => 11, :MCD => 3, :DIS => 9, :CRM => 8, :JNJ => 15 },
	{ :GOO => 17, :MMM => 14, :ADBE => 2, :EA=> 17, :BA => 7, :KO => 13, :XOM => 1, :GPS => 15, :MCD => 15, :DIS => 10, :CRM => 9, :JNJ => 17 }
	]);
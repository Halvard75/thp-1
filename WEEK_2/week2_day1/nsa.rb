def cesar_code(decalage, message)
  encryptage = ""
  alphabet = "!#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ[]^_`abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz{|}~"

  message.split("").each {|c|
    if c != " " 
      c_index = alphabet.index(c)
      nouvelle_position = c_index + decalage
      nouvel_alphabet = nouvelle_position % 144
      encryptage = encryptage + alphabet[nouvel_alphabet]
    else
      encryptage = encryptage + " "
    end
  }

  return encryptage
end

puts cesar_code(5, "what a string!")


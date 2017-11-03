require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand (100)
message = ""
secret_number_message = ""

get '/' do
  guess_number = params["guess"].to_i
  message = check_guess(guess_number)
  if message == "BIM ! Tu as la bonne réponse"
    secret_number_message = "\nLe chiffre top secret de ouf est #{SECRET_NUMBER}"
  end
  erb :index, :locals => {:message => message, :secret_number_message => secret_number_message}

end

def check_guess(guess_number)

  if guess_number > 100
    text = "Calme-toi, redescends en dessous de 100"
  elsif guess_number < SECRET_NUMBER && guess_number >= (SECRET_NUMBER - 10)
    text = "Presque, encore un peu"
  elsif guess_number < (SECRET_NUMBER - 10)
    text = "t'es loin bro, envoies du bois !"
  elsif guess_number > SECRET_NUMBER && guess_number <= (SECRET_NUMBER + 10)
    text = "calme-toi légèrement"
  elsif guess_number > (SECRET_NUMBER + 10)
    text = "Tu m'as pris pour un mégalo, redescends"
  elsif guess_number == SECRET_NUMBER
    text = "BIM ! Tu as la bonne réponse"
  end

  text
end

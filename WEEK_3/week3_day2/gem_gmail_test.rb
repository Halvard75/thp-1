require 'gmail'
gmail = Gmail.connect("x@gmail.com", "mdp")

gmail.deliver do
  to "destinataire"
  subject "THP c'est de la balle!"
  text_part do
    body "Text of plaintext message."
  end
  html_part do
    content_type 'text/html; charset=UTF-8'
    body "Petit Message envoyé depuis un code ruby, oh le petit hacker que je suis <br> GORTPS"
  end
# add_file "screen_save.png"
end
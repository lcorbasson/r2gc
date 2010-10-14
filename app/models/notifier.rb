class Notifier < ActionMailer::Base
  
  
  def send_informations_mail(recipients, sender_email, sender_name, tool_name, content)   
    recipients recipients
    from sender_email
    subject "Base de données équipement: Demande d'informations"
    content_type "text/html"


    body :content => content, :sender_name => sender_name, :email => sender_email, :tool_name => tool_name
  end

  def password_reset_instructions(user, password)
    subject    "réinitialisation de votre mot de passe pour accéder à la base de données ELGC"
    recipients user.email
    from       "contact@pole-gce.fr"
    content_type "text/html"


    body :user => user, :password => password
  end

 

end

class Notifier < ActionMailer::Base
  
  
  def send_informations_mail(recipients, sender_email, sender_name, tool_name, content)   
    recipients recipients
    from sender_email
    subject "Base de donnée équipements R2GC"
    body :content => content, :sender_name => sender_name, :email => sender_email, :tool_name => tool_name
  end

   def password_reset_instructions(user, password)
    subject    "Réinitialisation de votre mot de passe pour la base de données équipements"
    recipients user.email
    from       "contact@pole-gce.fr"
    body :user => user, :password => password
  end

end

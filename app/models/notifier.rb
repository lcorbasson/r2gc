class Notifier < ActionMailer::Base
  
  
   def send_informations_mail(recipients, sender_email, sender_name, tool_name, content)   
    recipients recipients
    from sender_email
    subject "Demande d'informations pour l'équipement #{tool_name}"    
    body :content => content, :name => sender_name, :email => sender_email, :tool_name => tool_name
  end

end

class Notifier < ActionMailer::Base
  
  
  def send_informations_mail(recipients, sender_email, sender_name, tool_name, content)   
    recipients recipients
    from sender_email
    subject "Base de données équipement: Demande d'informations"
    body :content => content, :sender_name => sender_name, :email => sender_email, :tool_name => tool_name
  end

  def password_reset_instructions(user, password)
    subject    "Réinitialisation de votre mot de passe pour la base de données équipements"
    recipients user.email
    from       "contact@pole-gce.fr"
    body :user => user, :password => password
  end

 def send_connexion_mail_for_manager(user, password)
  subject    "Mise en ligne de la base de données équipements"
  recipients user.email
  from       "contact@pole-gce.fr"
  body :user => user, :password => password

  attachment :content_type => "application/octet-stream", :body => File.read("#{RAILS_ROOT}/public/documents/informations.doc")
  attachment :content_type => "application/excel", :body => File.read("#{RAILS_ROOT}/public/documents/statuts.xls")

 end

 def send_connexion_mail_for_correspondent(user, password)
  subject    "Mise en ligne de la base de données équipements"
  recipients user.email
  from       "contact@pole-gce.fr"
  body :user => user, :password => password

   attachment :content_type => "application/octet-stream", :body => File.read("#{RAILS_ROOT}/public/documents/informations.doc"), :name => "informations.doc"
  attachment :content_type => "application/excel", :body => File.read("#{RAILS_ROOT}/public/documents/statuts.xls")
 end

 def send_connexion_mail_for_user(user, password)
  subject    "Mise en ligne de la base de données équipements"
  recipients user.email
  from       "contact@pole-gce.fr"
  body :user => user, :password => password

  attachment :content_type => "application/octet-stream", :body => File.read("#{RAILS_ROOT}/public/documents/informations.doc")
  attachment :content_type => "application/excel", :body => File.read("#{RAILS_ROOT}/public/documents/statuts.xls")

 end

 def send_connexion_mail_for_manager_and_correspondent(user, password)
  subject    "Mise en ligne de la base de données équipements"
  recipients user.email
  from       "contact@pole-gce.fr"
  body :user => user, :password => password

  attachment :content_type => "application/octet-stream", :body => File.read("#{RAILS_ROOT}/public/documents/informations.doc")
  attachment :content_type => "application/excel", :body => File.read("#{RAILS_ROOT}/public/documents/statuts.xls")

 end

 def send_update_mail_for_pgce_user(user)
  subject    "Base de données équipement: Mise à jour"
  recipients user.email
  from       "contact@pole-gce.fr"
  body :user => user

 end

 def send_update_mail_for_r2gc_manager(user)
  subject    "Base de données équipement: Mise à jour"
  recipients user.email
  from       "contact@pole-gce.fr"
  body :user => user

 end

 def send_update_mail_for_r2gc_correspondent(user)
  subject    "Base de données équipement: Mise à jour"
  recipients user.email
  from       "contact@pole-gce.fr"
  body :user => user

 end

end

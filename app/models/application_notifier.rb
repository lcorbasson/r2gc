class ApplicationNotifier < ActionMailer::Base


  layout 'mailer'

  default_url_options[:host] = PGCE_HOST



  def send_informations_mail(recipient_email, recipient_name, tool_name, content)
    set_default this_method
    recipients recipient_email
    subject "Demande d'informations pour l'équipement #{tool_name}"   
    body :content => content, :name => recipient_name, :tool_name => tool_name
  end

    
  private
    def set_default(method_name)
      from "R2GC <#{EMAIL_NO_REPLY}>"
      headers 'return-path' => from
      sent_on Time.zone.now
      content_type 'text/html'
      template "#{method_name}"
    end
end
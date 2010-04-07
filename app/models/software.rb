class Software < Tool



  def application_domains
    software_application_domains.join(", ")
  end

end

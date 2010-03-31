class Software < Tool

  has_and_belongs_to_many :software_statuses
  has_and_belongs_to_many :software_application_domains

  def application_domains
    software_application_domains.join(", ")
  end

end

class Consumer < ActiveRecord::Base

  belongs_to :consumer_role
  validates_presence_of :last_name, :first_name

 
end

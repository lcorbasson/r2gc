class ConsumerRole < ActiveRecord::Base

  has_many :consumers
  validates_presence_of :name

end

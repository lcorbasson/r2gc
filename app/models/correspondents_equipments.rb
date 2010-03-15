class CorrespondentsTools < ActiveRecord::Base

  belongs_to :correspondent
  belongs_to :tool

  validates_presence_of :correspondent, :tool

end

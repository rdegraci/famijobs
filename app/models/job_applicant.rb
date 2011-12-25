class JobApplicant < ActiveRecord::Base
  belongs_to :position
  validates_associated :position
  validates_presence_of :position
  
  belongs_to :user
  validates_associated :user
  validates_presence_of :user
  
end

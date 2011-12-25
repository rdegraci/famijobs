class Profile < ActiveRecord::Base
  belongs_to :user
  validates_associated :user
  validates_presence_of :user
  
  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :phone, :presence => true
end

class Profile < ActiveRecord::Base
  belongs_to :user
  validates_associated :user
end

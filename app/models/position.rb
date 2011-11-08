class Position < ActiveRecord::Base
  belongs_to :user
  has_many :job_applicants
  has_many :users, :through => :job_applicants
end

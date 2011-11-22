class Position < ActiveRecord::Base
  belongs_to :user
  has_many :job_applicants
  has_many :applicants, :through => :job_applicants, :source => :user
end

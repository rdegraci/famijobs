class Position < ActiveRecord::Base
  belongs_to :user
  validates_associated :user
  validates_presence_of :user
  
  validates :title, :presence => true
  validates :description, :presence => true
  validates :rate, :presence => true
  validates :open, :inclusion => { :in => [ true, false ] } 

   
   
  has_many :job_applicants, :dependent => :destroy
  has_many :applicants, :through => :job_applicants, :source => :user
      
  # Business Rules
  def self.open_positions
    Position.find_all_by_open(true) || []
  end
  
  def self.apply(positions, user)
    return [] if !user || positions.empty? == true
    positions.each do |position|
      position.applicants << user
      position.save
    end
  end
  
  def self.applied_by(user)
    return [] if !user
    user.applications
  end
  
  def self.unapply(positions, user)
    return [] if !user || positions.empty? == true
    positions.each do |position|
      position.applicants.delete(user)
      position.save
    end
  end
  
  def self.unapplied_by(user)
    return [] if !user
    Position.find_by_sql(['SELECT "positions".* FROM "positions" WHERE "positions".user_id <> ? EXCEPT SELECT "positions".* FROM "positions" INNER JOIN "job_applicants" ON "job_applicants".position_id = "positions".id ', user ])
  end
  
  
end

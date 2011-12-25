class User < ActiveRecord::Base
  
  has_many :positions, :dependent => :destroy
  has_one :profile, :dependent => :destroy
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
    
  has_many :job_applicants, :dependent => :destroy
  has_many :applications, :through => :job_applicants, :source => :position
  
end

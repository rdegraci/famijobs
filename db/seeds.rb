# Autogenerated by the db:seed:dump task
# Do not hesitate to tweak this to your needs

JobApplicant.create([
  { :created_at => nil, :updated_at => nil, :user_id => nil, :position_id => nil }
])

#Due to validations, User must be created first
User.create([
  { :password => '123456', :password_confirmation => '123456', :encrypted_password => "$2a$10$AvaG69ZHdb3xruEZKs36NuS.DVADuhW2z53BfSVEjj5Yfl2FJTMwS", :created_at => "2011-12-03 19:07:46", :last_sign_in_ip => "127.0.0.1", :updated_at => "2011-12-03 19:56:31", :last_sign_in_at => "2011-12-03 19:09:40", :sign_in_count => 3, :reset_password_token => nil, :current_sign_in_ip => "127.0.0.1", :reset_password_sent_at => nil, :remember_created_at => nil, :current_sign_in_at => "2011-12-03 19:56:31", :email => "user1@some.com" },
  { :password => '123456', :password_confirmation => '123456', :encrypted_password => "$2a$10$qaqHJK3O8fQoOJnmr.cxwOvoBtb9lFfBPYI9PHqTlbqrF5EQwFt9K", :created_at => "2011-12-03 19:08:06", :last_sign_in_ip => "127.0.0.1", :updated_at => "2011-12-03 19:58:45", :last_sign_in_at => "2011-12-03 19:08:06", :sign_in_count => 2, :reset_password_token => nil, :current_sign_in_ip => "127.0.0.1", :reset_password_sent_at => nil, :remember_created_at => nil, :current_sign_in_at => "2011-12-03 19:58:45", :email => "user2@some.com" }
])

Position.create([
  { :open => true, :created_at => "2011-12-03 19:08:41", :title => "Php dev", :updated_at => "2011-12-03 19:08:41", :rate => 1.0, :user_id => 2, :description => "Develops php" },
  { :open => true, :created_at => "2011-12-03 19:09:03", :title => "Perl dev", :updated_at => "2011-12-03 19:09:03", :rate => 2.0, :user_id => 2, :description => "Develops perl" },
  { :open => true, :created_at => "2011-12-03 19:09:18", :title => "Ruby dev", :updated_at => "2011-12-03 19:09:18", :rate => 3.0, :user_id => 2, :description => "Develops ruby" },
  { :open => true, :created_at => "2011-12-03 19:09:59", :title => "iOS dev", :updated_at => "2011-12-03 19:09:59", :rate => 4.0, :user_id => 1, :description => "Writes iOS apps" },
  { :open => true, :created_at => "2011-12-03 19:10:22", :title => "Android Dev", :updated_at => "2011-12-03 19:10:22", :rate => 6.0, :user_id => 1, :description => "Develop Android Apps" },
  { :open => true, :created_at => "2011-12-03 19:10:50", :title => "BlackBerry Dev", :updated_at => "2011-12-03 19:10:50", :rate => 7.0, :user_id => 1, :description => "Develops Blackberry Apps" }
])



Profile.create([
  { :address1 => "1234 A Street", :city => "Orlando", :address2 => "Apt 1", :created_at => "2011-12-03 19:58:05", :available => true, :zipcode => "32821", :updated_at => "2011-12-03 19:58:05", :skills => "skill1, skill2", :lastname => "User1Last", :user_id => 1, :firstname => "User1First", :phone => "123-555-1234", :jobtitle => "User1Title", :state => "FL" },
  { :address1 => "5678 B Street", :city => "Orlando", :address2 => "Apt 1", :created_at => "2011-12-03 19:59:39", :available => true, :zipcode => "32821", :updated_at => "2011-12-03 19:59:39", :skills => "Skill1, Skill2", :lastname => "User2Last", :user_id => 2, :firstname => "User2First", :phone => "123-555-6789", :jobtitle => "User2Title", :state => "FL" }
])







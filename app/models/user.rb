class User < ActiveRecord::Base
  attr_accessible :name, presence:true, uniqeness:true
  attr_accessible :password
  attr_accessible :password_confirmation
  has_secure_password
end

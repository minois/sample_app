class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates(:name, presence:true, length:{ maximum: 50 })
	VALID_EMAIIL_REGEX = /\A[\w+\-.]+@[A-Z\d\-.]+\.[a-z]+\z/i
	validates(:email, presence:true, 
		format:{ with: VALID_EMAIIL_REGEX }, 
		uniqueness: { case_sensitive: false })
	has_secure_password
	validates(:password, length:{ minimum: 6 })
end

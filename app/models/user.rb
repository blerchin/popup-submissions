class User < ActiveRecord::Base
	has_many :installations
	has_many :applications

	#before_save :encrypt_password
	#validates_presence_of :password, :on => :create
	validates_presence_of :username
	#validates_uniqueness_of :username


	def self.authenticate(u, p)
		user = User.where( :username => u).take
		if user && user.password_hash == BCrypt::Engine.hash_secret(p, user.password_salt)
			user
		else
			nil
		end
	end

	def password=(password)
		if password
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end
		
end

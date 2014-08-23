class User < ActiveRecord::Base

	require 'digest/sha2'
	attr_accessor :password
	
	validates :username, :first_name, :last_name, { presence: true }
	validates :username, :email, { uniqueness: true }
	validates :password, { presence: true }
	validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Invalid Email Address" }

	before_save :password
	before_save :generatecodes!

	def generatecodes! # acts upon object instead of returning result
		# Confirmation code
		if self.confirmation_code.nil?
			self.confirmation_code = Digest::SHA256.hexdigest( self.email + self.id.to_s )
		end
		# Cancelation code
		if self.cancelation_code.nil?
			self.cancelation_code = Digest::SHA256.hexdigest( self.username + self.email + self.id.to_s )
		end

	end

	def password= password

		if password.empty?
			"xxxxxxxxx"
		else
			false
		end

		# Salt
		self.password_salt = [Array.new( 6 ){rand( 256 ).chr}.join].pack( "m" ).chomp
		# Password Hash
		self.password_hash = Digest::SHA256.hexdigest( password + self.password_salt )
	end

	def self.authenticate username, password
		user = User.find_by_username username
		fromUser = Digest::SHA256.hexdigest( password + user.password_salt )
		if fromUser == user.password_hash
			return "Authenticated!!"
		else
			return "Username or password doesn't match. :-("
		end
	end

	def verify! conf_code
		user = User.find self.id
		if self.confirmation_code == conf_code 
			user.verified = true
			self.update_attributes(:verified => true)
			self.save
		 	"User: #{self.username} has been verified!"
		 	true
		else
			"The user could not be verified. User not in database?"
			false
		end
	end
	def self.cancel! user_id, can_code 
		user = User.find user_id
		if user.cancelation_code == can_code
			user.delete
			"#{user.username} has been deleted"
			true
		else
			"Wrong cancelation code! :("
			false
		end
	end
	
	def self.verified 
		User.where({verified:true})
	end
	# User.where({ name: "Joe", email: "joe@example.com" })

	# User.create username: "richard", eller", email: "richard@gurustu.co"
	# u1 = User.create username: "richard", first_name: "richard", last_name: "keller", email: "richard@gurustu.co"
	# u1 = User.create username: "Richardbenjamin", first_name: "Rick", last_name: "killer", email: "richard.be.jamin@gmail.com", password: "ez2rembr!@#"
end

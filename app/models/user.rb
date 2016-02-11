class User < ActiveRecord::Base
	validates :user_name, presence: { message: "No user_name given"}
	validates :screen_name, presence: { message: "No screen_name given"}
	validates :email, presence: { message: "No email given"}
	validates :password, presence: { message: "No password given"}
end

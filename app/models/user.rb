class User < ActiveRecord::Base

attachment :profile_image

 has_secure_password

has_many :workouts
accepts_attachments_for :images

acts_as_followable
acts_as_follower

end

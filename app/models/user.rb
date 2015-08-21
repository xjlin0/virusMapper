class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
    
  has_many :posts, dependent: :destroy
  
	has_many :spyings, class_name: "Followship", foreign_key: :followee_id, dependent: :destroy
	has_many :idols, class_name: "User", through: :spyings, source: :follower

	has_many :stalkers, class_name: "Followship", foreign_key: :follower_id, dependent: :destroy
	has_many :fans, class_name: "User", through: :stalkers, source: :followee
end

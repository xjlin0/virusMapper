class Followship < ActiveRecord::Base
  belongs_to :followee, class_name: 'User'
  belongs_to :follower, class_name: 'User'

  validates :followee_id, presence: true
  validates :follower_id, presence: true

  validates :followee_id, uniqueness: {scope: :follower_id}
end

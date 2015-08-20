class Followship < ActiveRecord::Base
  belongs_to :from, class_name: 'User'
  belongs_to :follower, class_name: 'User'
end

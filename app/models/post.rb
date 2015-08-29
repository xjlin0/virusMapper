class Post < ActiveRecord::Base
  belongs_to :user, counter_cache: :post_count

  validates :content, presence: true
  validates :user_id, presence: true
  #validates_length_of :content, maximum: 140
end

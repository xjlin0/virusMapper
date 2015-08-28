class Post < ActiveRecord::Base
  belongs_to :user, counter_cache: :post_count

  validates :content, presence: true
  validates :user_id, presence: true
end

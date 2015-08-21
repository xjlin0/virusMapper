class CreateFollowships < ActiveRecord::Migration
  def change
    create_table :followships do |t|
      t.references :followee, index: true#, foreign_key: true
      t.references :follower, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end

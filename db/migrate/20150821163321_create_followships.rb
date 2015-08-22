class CreateFollowships < ActiveRecord::Migration
  def change
    create_table :followships do |t|
      t.references :followee, index: true#, foreign_key: true
      t.references :follower, index: true#, foreign_key: true

      t.timestamps null: false
    end #The following index use the pair as the key and ensure uniqueness
    add_index :followships, [:followee_id, :follower_id], unique: true
  end
end

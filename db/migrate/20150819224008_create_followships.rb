class CreateFollowships < ActiveRecord::Migration
  def change # In MySQL, adding "foreign_key: true" after these references will result in errors during db:migration
    create_table :followships do |t|
      t.references :from, index: true
      t.references :follower, index: true

      # t.references :followee, index: true  #from
      # t.references :follower, index: true  #to

      t.timestamps
    end # the followed indexing/unique line is neglectable
    #add_index :followships, [ :from_id, :to_id ], unique: true
  end
end

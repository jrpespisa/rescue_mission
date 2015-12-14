class RemoveQueries < ActiveRecord::Migration
  def up
    drop_table :queries
  end

  def down
    create_table :queries do |t|
      t.integer :user_id, null: false
      t.integer :question_id, null: false
    end
  end
end

class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.integer :user_id, null: false
      t.integer :question_id, null: false
    end
  end
end

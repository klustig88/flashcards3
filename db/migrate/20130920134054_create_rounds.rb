class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :score, default: 0 
      t.integer :deck_id
      t.integer :user_id
      t.integer :counter, default: 0
      t.timestamps
    end
  end
end

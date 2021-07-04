class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.integer :energy_id,      null: false
      t.integer :food_id,        null: false
      t.integer :toilet_id,      null: false
      t.integer :poop_status_id, null: false
      t.integer :exercise_id,    null: false
      t.integer :sleep_id,       null: false
      t.integer :different_id,   null: false
      t.references :user,        null: false, foreign_key: true
      t.datetime :start_time
      t.timestamps
    end
  end
end

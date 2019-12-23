class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.references :user, foreign_key: true, null: false, index: true
      t.datetime :start, null: false
      t.datetime :finish, null: false
      t.integer :break_length_in_minutes, null: false, default: 0
    end
  end
end

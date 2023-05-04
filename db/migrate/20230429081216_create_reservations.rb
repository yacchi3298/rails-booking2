class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.datetime  :checkin
      t.datetime  :checkout
      t.integer  :Number_of_people


      t.timestamps
    end
  end
end

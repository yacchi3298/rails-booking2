class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :image
      t.string :name
      t.text :introduction
      t.bigint :priice
      t.string :address
      t.integer :user_id

      t.timestamps
    end
  end
end

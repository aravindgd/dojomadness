class CreateHeroes < ActiveRecord::Migration[5.0]
  def change
    create_table :heroes do |t|
      t.string :name
      t.string :real_name
      t.integer :health
      t.integer :armour
      t.integer :shield

      t.timestamps
    end
  end
end

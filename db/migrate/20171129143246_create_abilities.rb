class CreateAbilities < ActiveRecord::Migration[5.0]
  def change
    create_table :abilities do |t|
      t.string :name
      t.text :description
      t.boolean :is_ultimate
      t.belongs_to :hero, foreign_key: true

      t.timestamps
    end
  end
end

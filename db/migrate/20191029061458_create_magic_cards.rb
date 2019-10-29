class CreateMagicCards < ActiveRecord::Migration[5.2]
  def change
    create_table :magic_cards do |t|
      t.string :image
      t.string :name
      t.string :artist

      t.timestamps
    end
  end
end

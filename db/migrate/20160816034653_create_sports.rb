class CreateSports < ActiveRecord::Migration[5.0]
  def change
    create_table :sports do |t|
      t.string :name
      t.integer :players
      t.string :country_of_origin

      t.timestamps
    end
  end
end

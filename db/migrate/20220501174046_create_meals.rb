class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.string :title
      t.text :notes
      t.timestamps
    end
  end
end

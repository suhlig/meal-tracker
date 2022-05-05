class CreateCookings < ActiveRecord::Migration[7.0]
  def change
    create_table :cookings do |t|
      t.date :cooked_at
      t.references :meal, null: false, foreign_key: true

      t.timestamps
    end
  end
end

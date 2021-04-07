class CreateAttractions < ActiveRecord::Migration[6.0]
  def change
    create_table :attractions do |t|
      t.string :title
      t.text :description
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
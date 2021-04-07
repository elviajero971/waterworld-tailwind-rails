class AddSlugToAttractions < ActiveRecord::Migration[6.0]
  def change
    add_column :attractions, :slug, :string
  end
end

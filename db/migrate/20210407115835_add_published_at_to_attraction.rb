class AddPublishedAtToAttraction < ActiveRecord::Migration[6.0]
  def change
    add_column :attractions, :published_at, :datetime
    add_column :categories, :published_at, :datetime
  end
end

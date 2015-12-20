class AddRatingToStories < ActiveRecord::Migration
  def change
    add_column :stories, :rating, :float, default: 0, null: false
  end
end

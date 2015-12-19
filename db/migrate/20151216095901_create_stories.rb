class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :content

      t.references :user, index: true
      t.references :category, index: true

      t.timestamps null: false
    end
  end
end

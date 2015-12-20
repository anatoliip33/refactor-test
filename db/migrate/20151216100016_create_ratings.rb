class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rate, default: 0, null: false
      t.references :story, foreign_key: true, index: true, null: false
      t.references :user, foreign_key: true, index: true, null: false

      t.timestamps null: false
    end
  end
end

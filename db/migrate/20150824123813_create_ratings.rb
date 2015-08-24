class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.text :comment
      t.integer :grade

      t.timestamps null: false
    end
  end
end

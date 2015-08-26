class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title
      t.text :description
      t.string :district
      t.integer :average_grade
      
      t.timestamps null: false
    end
  end
end

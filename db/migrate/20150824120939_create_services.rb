class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string     :title
      t.text       :description
      t.string     :district
      t.belongs_to :user, foreign_key: true, index: true
      t.belongs_to :category

      t.timestamps null: false
    end
  end
end

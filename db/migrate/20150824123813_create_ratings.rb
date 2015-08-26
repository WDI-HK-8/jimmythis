class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.text       :comment
      t.integer    :grade

      t.belongs_to :service
      t.belongs_to :user, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end

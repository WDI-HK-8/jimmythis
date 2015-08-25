class AddCategoryToService < ActiveRecord::Migration
  def change
    change_table :services do |t|
      t.belongs_to :category
    end
  end
end

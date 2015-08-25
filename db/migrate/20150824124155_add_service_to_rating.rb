class AddServiceToRating < ActiveRecord::Migration
  def change
    change_table :ratings do |t|
      t.belongs_to :service
      t.belongs_to :user, foreign_key: true, index: true
    end
  end
end

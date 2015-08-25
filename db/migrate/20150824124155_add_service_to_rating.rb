class AddServiceToRating < ActiveRecord::Migration
  def change
    change_table :ratings do |t|
      t.belongs_to :service
    end
  end
end

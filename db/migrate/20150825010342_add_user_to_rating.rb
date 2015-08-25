class AddUserToRating < ActiveRecord::Migration
  def change
    change_table :ratings do |t|
      t.belongs_to :user
    end
  end
end

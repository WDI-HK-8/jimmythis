class AddUserToService < ActiveRecord::Migration
  def change
    change_table :services do |t|
      t.belongs_to :seller
    end
  end
end

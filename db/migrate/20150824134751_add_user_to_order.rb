class AddUserToOrder < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.belongs_to :seller
      t.belongs_to :client
    end
  end
end

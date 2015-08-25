class AddUserToOrder < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.belongs_to :user, foreign_key: true, index: true
    end
  end
end

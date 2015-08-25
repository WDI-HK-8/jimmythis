class AddUserToService < ActiveRecord::Migration
  def change
    change_table :services do |t|
      t.belongs_to :user, foreign_key: true, index: true
    end
  end
end

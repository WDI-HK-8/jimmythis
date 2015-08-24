class AddServiceToOrder < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.belongs_to :service
    end
  end
end

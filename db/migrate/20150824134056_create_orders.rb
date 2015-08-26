class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status
      t.belongs_to :service
      t.belongs_to :user, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end

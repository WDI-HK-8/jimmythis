class Order < ActiveRecord::Base
  belongs_to :service
  belongs_to :client, class_name: "User", foreign_key: "client_id"
  belongs_to :seller, class_name: "User", foreign_key: "seller_id"
end

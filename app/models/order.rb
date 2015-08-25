class Order < ActiveRecord::Base
  belongs_to :service
  belongs_to :client, class_name: "User"
  belongs_to :seller, class_name: "User"
end

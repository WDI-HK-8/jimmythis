class Service < ActiveRecord::Base
  belongs_to :category
  belongs_to :seller, class_name: "User", foreign_key: "seller_id"
  has_many :ratings
  has_many :orders
end

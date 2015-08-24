class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User
  
  has_many :services
  has_many :ratings
  has_many :purchases, class_name: "Order"
  has_many :sales, class_name: "Order"
end

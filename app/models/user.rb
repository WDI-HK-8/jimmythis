class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User
  
  has_many :services
  has_many :ratings
  belongs_to :seller, class_name: "User"
  belongs_to :client, class_name: "User"
end

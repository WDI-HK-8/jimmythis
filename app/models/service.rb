class Service < ActiveRecord::Base
  belongs_to :category
  belongs_to :seller, class_name: "User"
  has_many :ratings
  has_many :orders

  def average_rating
    self.ratings.average(:grade)
  end
end

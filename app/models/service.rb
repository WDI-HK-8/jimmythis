class Service < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :ratings
  has_many :orders

  def average_rating
    self.ratings.average(:grade)
  end
end

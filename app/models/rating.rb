class Rating < ActiveRecord::Base
  belongs_to :service
  belongs_to :client, class_name: "User"
end

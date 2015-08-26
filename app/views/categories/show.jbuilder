json.array! @services do |service|
  json.id service.id
  json.title service.title
  json.description service.description
  json.district service.district
  json.category_id service.category_id
  json.created_at service.created_at
  json.user service.user
  json.ratings service.ratings
  json.average_rating service.average_rating
end 

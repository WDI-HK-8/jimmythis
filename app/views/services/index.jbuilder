json.array! @services do |service|
  json.id service.id
  json.title service.title
  json.description service.description
  json.district service.district
  json.category_id service.category_id
  json.created_at service.created_at
  json.user_id service.user_id
  json.rating service.rating
end 

json.array! @services do |service|
  json.id service.id
  json.title service.title
  json.description service.description
  json.district service.district
  json.category service.category
  json.created_at service.created_at
  json.user service.user
  json.ratings service.ratings
end 

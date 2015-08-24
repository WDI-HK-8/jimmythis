json.array! @info.services do |service|
  json.id service.id
  json.title service.title
  json.description service.description
  json.district service.district
  json.category_id service.category_id
  json.created_at service.created_at
end

json.array! @info.orders do |order|
  json.id order.id
  json.title order.status
  json.created_at order.created_at
end

json.extract! @info.user, :id, :name, :email, :password, :phone, :description, :created_at, :updated_at
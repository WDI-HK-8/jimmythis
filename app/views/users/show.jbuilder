if @orders
  json.array! @orders do |order|
    json.id order.id
    json.status order.status
    json.created_at order.created_at
    json.service order.service
  end
elsif @services
  json.array! @services do |service|
    json.id service.id
    json.title service.title
    json.description service.description
    json.district service.district
    json.category service.category
    json.created_at service.created_at
    json.user service.user
    json.orders service.orders
  end
else
  json.id @user.id
  json.name @user.name
  json.phone @user.phone
  json.email @user.email
  json.description @user.description
end
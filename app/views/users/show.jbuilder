if @orders
  json.array! @orders do |order|
    json.id order.id
    json.status order.status
    json.created_at order.created_at
  end
elsif @services
  json.array! @services do |service|
    json.id service.id
    json.title service.title
    json.description service.description
    json.district service.district
    json.category_id service.category_id
    json.created_at service.created_at
    json.user_id service.user_id
  end
else
  json.name @user.name
  json.phone @user.phone
  json.email @user.email
  json.description @user.description
end
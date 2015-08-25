json.extract! @info.user, :id, :name, :email, :password, :phone, :description, :created_at, :updated_at

json.array! @info.ratings do |rating|
  json.id rating.id
  json.grade rating.grade
  json.comment rating.comment
  json.user rating.user_id
  json.created_at rating.created_at
end

json.extract! @info.service, :title, :description, :district, :created_at, :category, :updated_at 

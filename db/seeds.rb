# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

names = ["arnold","cassie","roger","bill","myles"]
titles = ["build website","mow lawn","sing a song","clean out your garage","do your taxes"]
districts = ["sheung wan","central","wong chuk hang","stanley","mong kok"]
categories = ["Advertising","Art & Creative","Business","Fun & Bizarre","Gift Ideas","Graphics","Health & Wellness","Music & Audio","Other","Photography","Programming","Social Marketing","Technology","Tips & Advice","Translation Services","Video","Writing"]

categories.each do |category|
  c = Category.new(name: category)
  c.save
end

user = User.new(name: "stacy", email: "stacy@gmail.com", password: "stacy12345", description: "Stacy's new description", phone: 12345678)
user.save

names.each do |name|
  user = User.new(name: name, email: "#{name}@gmail.com", password: "#{name}12345", description: "#{name}\'s new description", phone: 12345678)
  
  if user.save
    service = user.services.new(title: titles[names.index(name)],district: districts[names.index(name)],description: titles[names.index(name)]+' for only $50!!', category_id: c.id)
    if service.save
      user = User.find(names.index(name)+1)
      rating = service.ratings.create(comment: 'I liked it!!', grade: 8, user_id: user.id)
      if rating.save
        order = service.orders.create(status: 'almost done', user_id: user.id)
        order.save
      end
    end
  end
end

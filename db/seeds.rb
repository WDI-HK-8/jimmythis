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

category = Category.new(name: 'Funny')
category.save



names.each do |name|
  user = User.new(name: name,email: name+'@gmail.com',password: name+'12345',description: name+'\'s new description',phone: 12345678)
  if user.save
    service = Service.new(title: titles[names.index(name)],district: districts[names.index(name)],description: titles[names.index(name)]+' for only $50!!',seller: User.find(names.index(name)).id,category_id: category.id)
    if service.save
      user = User.find(user.id-1)
      rating = Service.find(names.index(name)).ratings.create(comment: 'I liked it!!', grade: 8, client: user.id)
      if rating.save
        order = Service.find(names.index(name)).ratings.create(status: 'almost done', client: user.id)
        order.save
      end
    end
  end
end

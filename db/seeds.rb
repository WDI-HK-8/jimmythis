categories = ["Advertising","Art & Creative","Business","Fun & Bizarre","Gift Ideas","Graphics","Health & Wellness","Music & Audio","Other","Photography","Programming","Social Marketing","Technology","Tips & Advice","Translation Services","Video","Writing"]
categories.each { |category| Category.create(name: category)}
category = Category.first

User.create(
  name:        "stacy",
  email:       "stacy@gmail.com",
  password:    "stacy12345",
  description: "Stacy's new description",
  phone:       12345678
)

titles     = ["build website","mow lawn","sing a song","clean out your garage","do your taxes"]
districts  = ["sheung wan","central","wong chuk hang","stanley","mong kok"]

names = %w(arnold cassie roger bill myles)
names.each do |name|
  user = User.create(
    name:        name,
    email:       "#{name}@gmail.com",
    password:    "#{name}12345",
    description: "#{name}\'s new description",
    phone:       12345678
  )

  user_pos = names.index(name)
  service = user.services.create(
    title:       titles[user_pos],
    district:    districts[user_pos],
    description: "#{titles[user_pos]} for only $50!!",
    category:    category
  )

  user2 = User.where.not(name: user.name).sample
  service.ratings.create(
    comment: 'I liked it!!',
    grade: 8,
    user: user2
  )

  user3 = User.where.not(name: user.name).sample
  service.orders.create(status: 'almost done', user: user3)
end

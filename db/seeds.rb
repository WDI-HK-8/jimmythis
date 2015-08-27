categories = ["Advertising","Art & Creative","Business","Fun & Bizarre","Gift Ideas","Health & Wellness","Household","Music & Audio","Other","Photography","Programming","Social Marketing","Technology","Tips & Advice","Translation Services","Video","Writing"]
categories.each { |category| Category.create(name: category)}
category = Category.first

User.create(
  name:        "Stacy",
  email:       "stacy@gmail.com",
  password:    "stacy12345",
  description: "I have been one of the most successful and consistent advertisers on Jimmy This. 
I am a student at the University of Hong Kong, and I will fulfill your flyering needs for you! ",
  phone:       12345678
)

titles     = ["I will post 50 flyers for you at the closest University","
I will translate English to Spanish 500 words","sing a song","I will record a voice message as a celebrity or cartoon up to 30 sec","
I will give you a psychic love reading in live", "I will write message in beach sand at sunrise", "I will clean your apartment for 1 hour"]
districts  = ["Sheung Wan","Central","Wong Chuk Hang","Stanley","Mong Kok"]

names = %w(Richard Kody Jeff Harry Raphael)
names.each do |name|
  user = User.create(
    name:        name,
    email:       "#{name}@gmail.com",
    password:    "#{name}12345",
    description: "#{name}\'s been one of the most successful and consistent advertisers on Jimmy This. 
I am a student at the University of Hong Kong",
    phone:       12345678
  )

  user_pos = names.index(name)
  service = user.services.create(
    title:       titles[user_pos],
    district:    districts[user_pos],
    description: "You got the script.. I got the voices!! As I stated above I will record a message in a celebrity or cartoon voice of your choosing for only $5 for 0-30 sec Ideal for Happy Birthday messages,Answering machines,DJ Drops,Radio Sweepers,etc.",
    category:    category
  )

  user2 = User.where.not(name: user.name).sample
  service.ratings.create(
    comment: 'Amazing work! Looking forward to working together again.',
    grade: 5,
    user: user2
  )

  user3 = User.where.not(name: user.name).sample
  service.orders.create(status: 'Awaiting', user: user3)
end

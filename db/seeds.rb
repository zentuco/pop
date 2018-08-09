# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(designer: true, username: "zentuco", email: "pool@printables.io", password: "hugocollado", printer: "prusa", first_name: "Hugo", last_name: "Collado", photo: "http://kitt.lewagon.com/placeholder/users/zentuco",)
User.create(admin: true, username: "vananreed", email: "pool@printables.io", password: "reedvan", printer: "HUGE", first_name: "Reed", last_name: "Van Anrooy", photo: "http://kitt.lewagon.com/placeholder/users/vananreed",)
User.create(username: "lancekrp", email: "pool@printables.io", password: "lancepurnell", printer: "Expensive", first_name: "Lance", last_name: "Purnell", photo: "http://kitt.lewagon.com/placeholder/users/lancekrp",)
User.create(username: "jamesthebrit", email: "pool@printables.io", password: "jamesrevan", printer: "has lazer beams", first_name: "James", last_name: "Revan", photo: "http://kitt.lewagon.com/placeholder/users/jamesrevan",)



names = ["High Velocity Jet Boat with Hydroactive Engine", "Pikachu", "Woman's Face", "Smith and Wesson .45 caliber Revolver Replica"]
categories = ["3D printing", "art", "fashion", "gadgets", "hobby", "models", "toys & games"]
files = ["https://cdn.thingiverse.com/renders/6e/6a/c6/99/1d/93a2a8c29cb9a45adb59788730067b76_preview_featured.jpg",
"https://cdn.thingiverse.com/renders/eb/82/1d/68/d3/1ab6e872c41d8bae20498529a5f6f166_preview_featured.jpg",
"https://cdn.thingiverse.com/renders/52/ca/a7/95/6e/a13f5a922175ce15a5f2f6f7ef4fedb4_preview_featured.jpg",
"https://cdn.thingiverse.com/renders/73/64/3c/4c/ea/def064c56ca496a660e99446ec1fa4f3_preview_featured.jpg",
"https://cdn.thingiverse.com/renders/b5/60/d4/44/a5/8e1b1d0f263af0eaef4ee35134bb961b_preview_featured.jpg"]

categories.each do |category|
  Category.create(name: category)
end

20.times do
  design = Design.new(
    name: names.sample,
    description: "An Amazing 3D printing design that will wow you beyond yout wildest dreams and send you offline wishing you had downloaded more files of this amazing product.",
    likes: rand(1000),
  )
  design.category = Category.all.sample
  design.save!
end

files.each do |file|
  attachment = Attachment.new(file: file)
  attachment.design = Design.all.sample
  attachment.save!
end

20.times do
  request = Request.new(
    kind: rand(1),
    description: "I want this model to be at least three times bigger than this and have a hook on the top so I can hang it from the chandelier over my bed."
  )
  request.design = Design.all.sample
  request.user = User.all.sample
  request.save!
end

5.times do
  project = Project.new(accepted_price: rand(1000), file: files.sample)
  project.user = User.all.sample
  project.request = Request.all.sample
  project.save!
end

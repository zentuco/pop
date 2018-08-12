# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Wallet.destroy_all
Project.destroy_all
Contribution.destroy_all
Request.destroy_all
User.destroy_all
User.create(designer: true, username: "zentuco", email: "pool@printables.io", password: "hugocollado", printer: "prusa", first_name: "Hugo", last_name: "Collado", photo: "http://kitt.lewagon.com/placeholder/users/zentuco",)
User.create(admin: true, username: "vananreed", email: "pool2@printables.io", password: "reedvan", printer: "HUGE", first_name: "Reed", last_name: "Van Anrooy", photo: "http://kitt.lewagon.com/placeholder/users/vananreed",)
User.create(username: "lancekrp", email: "pool3@printables.io", password: "lancepurnell", printer: "Expensive", first_name: "Lance", last_name: "Purnell", photo: "http://kitt.lewagon.com/placeholder/users/lancekrp",)
User.create(username: "jamesthebrit", email: "pool4@printables.io", password: "jamesrevan", printer: "has lazer beams", first_name: "James", last_name: "Revan", photo: "http://kitt.lewagon.com/placeholder/users/jamesrevan",)



names = ["High Velocity Jet Boat with Hydroactive Engine", "Pikachu", "Woman's Face", "Smith and Wesson .45 caliber Revolver Replica"]
categories = ["3D printing", "art", "fashion", "gadgets", "hobby", "models", "toys & games"]
files = ["https://static.turbosquid.com/Preview/2014/07/09__20_21_44/r1.jpgcab6992b-4c0d-442b-ba77-217e5b11791fOriginal.jpg",
"https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/1a6c4a35197101.56ed59f658dc9.jpg",
"https://img-new.cgtrader.com/items/666198/ce720a5f09/themis-printable-3d-model-stl.jpg",
"https://3dexport.com/items/2014/03/19/371641/82016/guan_yu_statues_sculpture7_3d_model_c4d_max_obj_fbx_ma_lwo_3ds_3dm_stl_941544_o.jpg",
"https://img2.cgtrader.com/items/278201/bc95e87f5e/large/male-ecorche-human-anatomy-reference-3d-model-stl.jpg"]

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
100.times do
  files.each do |file|
    attachment = Attachment.new
    attachment.remote_file_url = file
    attachment.design = Design.all.sample
    attachment.save!
  end
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

100.times do
  contribution = Contribution.new(
    tokens: rand(1000)
  )
  contribution.request = Request.all.sample
  contribution.user = User.all.sample
  contribution.save!
end

User.all.each do |user|
  user.wallet = Wallet.create
end

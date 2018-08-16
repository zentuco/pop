
Wallet.destroy_all
Project.destroy_all
Contribution.destroy_all
Request.destroy_all
User.destroy_all

##keep this
u =User.new(designer: true, username: "zentuco", email: "pool@printables.io", password: "hugocollado", printer: "prusa", first_name: "Hugo", last_name: "Collado")
u.remote_photo_url= "https://res.cloudinary.com/lancekrp/image/upload/v1534147692/zentuco.jpg"
u.save
u =User.new(admin: true, username: "vananreed", email: "pool2@printables.io", password: "reedvan", printer: "HUGE", first_name: "Reed", last_name: "Van Anrooy")
u.remote_photo_url=  "https://res.cloudinary.com/lancekrp/image/upload/v1534147686/vananreed.png"
u.save
u =User.new(username: "lancekrp", email: "pool3@printables.io", password: "lancepurnell", printer: "Expensive", first_name: "Lance", last_name: "Purnell")
u.remote_photo_url=  "https://res.cloudinary.com/lancekrp/image/upload/v1534144047/dmypmwzd9xtu3fa22rso.jpg"
u.save
u =User.new(username: "jamesthebrit", email: "pool4@printables.io", password: "jamesrevan", printer: "has lazer beams", first_name: "James", last_name: "Revan")
u.remote_photo_url= "https://res.cloudinary.com/lancekrp/image/upload/v1534147678/jamesrevan.jpg"
u.save


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
##

#
# need to repeat this section to create another unique project
#
dtrump = Design.new(
    name: "Donald Trump's head",
    description: "This design is perfect for bobble heads and other memorabilia.",
    likes: rand(1000),
  )
dtrump.category = Category.find_by(name: "3D printing")
dtrump.save!
attachment = Attachment.new
attachment.remote_file_url = files[1]
attachment.design = dtrump
attachment.save!
request = Request.new(
    kind: :original,
    description: "I need a Donald Trump Bust that shows his shoulders as well. I would like him to be wearing his classic suit and tie."
  )
request.design = dtrump
request.user = User.all.sample
request.save!
contribution = Contribution.new(
    tokens: rand(1000)
  )
contribution.request = request
contribution.user = request.user
contribution.save!

project = Project.new(accepted_price: rand(1000))
project.user = User.where(designer: true).sample
r = Request.new(kind: :original, description: "I would like this same design but without Donald Trump's toupee")
r.design = dtrump
r.user = User.where(designer: false).sample
project.request = r
project.save!

#
#
#

beast = Design.new(
    name: "Gargoyle action figure",
    description: "This design makes a perfect toy for the young kid.",
    likes: rand(1000),
  )
beast.category = Category.find_by(name: "toys & games")
beast.save!
attachment = Attachment.new
attachment.remote_file_url = files[0]
attachment.design = beast
attachment.save!
request = Request.new(
    kind: :improve,
    description: "I want the fingers to be less sharp so that my kid will not hurt himself while playing with this toy"
  )
request.design = beast
request.user = User.all.sample
request.save!
contribution = Contribution.new(
    tokens: rand(1000)
  )
contribution.request = request
contribution.user = request.user
contribution.save!

project = Project.new(accepted_price: rand(1000))
project.user = User.where(designer: true).sample
r = Request.new(kind: :improve, description: "I would like the same model in a female version.")
r.design = beast
r.user = User.where(designer: false).sample
project.request = r
project.save!

20.times do
  design = Design.new(
    name: names.sample,
    description: "An Amazing 3D printing design that will wow you beyond yout wildest dreams and send you offline wishing you had downloaded more files of this amazing product.",
    likes: rand(1000),
  )
  design.category = Category.all.sample
  design.save!
end
10.times do
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

## keep this
100.times do
  contribution = Contribution.new(
    tokens: rand(1000)
  )
  contribution.request = Request.all.sample
  contribution.user = User.all.sample
  contribution.save!
end
##

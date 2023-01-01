# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!(name: 'Roupas')
Category.create!(name: 'Sapatos')
Category.create!(name: 'Acessórios')
Category.create!(name: 'Eletrônicos e Eletrodomésticos')

Brand.create!(name: 'Louis Vitão')
Brand.create!(name: 'Naike')
Brand.create!(name: 'Adidos')
Brand.create!(name: 'Roleqs')
Brand.create!(name: 'Maçã')
Brand.create!(name: 'Sem sunga')

obj = Product.create!(name: 'Vestido longo de prada', price: 120000, stock_quantity: 50, brand_id: 1, category_id: 1)
obj.images.attach(io: File.open('./public/assets/vestido-de-prada/laura-chouette-Kd8Bw6s9xDc-unsplash.jpg'), 
filename: 'laura-chouette-Kd8Bw6s9xDc-unsplash.jpg')
obj.images.attach(io: File.open('./public/assets/vestido-de-prada/laura-chouette-Y32i6makEcs-unsplash.jpg'), 
filename: 'laura-chouette-Y32i6makEcs-unsplash.jpg')

obj = Product.create!(name: 'Bolsa luxuosa de veludo', price: 200000, stock_quantity: 24, brand_id: 1, category_id: 3)
obj.images.attach(io: File.open('./public/assets/bolsa-luxuosa/arno-senoner-oCXVxwTFwqE-unsplash.jpg'),
filename: 'arno-senoner-oCXVxwTFwqE-unsplash.jpg')

obj = Product.create!(name: 'Calça moletom', price: 24999, stock_quantity: 200, brand_id: 3, category_id: 1)
obj.images.attach(io: File.open('./public/assets/calça-moletom/mike-von-ZrP2ahtPsG8-unsplash.jpg'),
filename: 'mike-von-ZrP2ahtPsG8-unsplash.jpg' )
obj.images.attach(io: File.open('public/assets/calça-moletom/siarhei-plashchynski-3bd0Z5l1hS8-unsplash.jpg'),
filename: 'siarhei-plashchynski-3bd0Z5l1hS8-unsplash.jpg')

obj = Product.create!(name: 'Camisa térmica comprida', price: 8999, stock_quantity: 243, brand_id: 2, category_id: 1)
obj.images.attach(io: File.open('public/assets/camisa-térmica-comprida/download.jpg'),
filename: 'download.jpg')
obj.images.attach(io: File.open('public/assets/camisa-térmica-comprida/shopping (1).png'),
filename: 'shopping (1).png')
obj.images.attach(io: File.open('public/assets/camisa-térmica-comprida/shopping.png'), 
filename: 'shopping.png')

obj = Product.create!(name: 'Casaco de zíper', price: 14999, stock_quantity: 205, brand_id: 3, category_id: 1)
obj.images.attach(io: File.open('./public/assets/casaco-de-zíper/download (1).jpg'),
filename: 'download (1).jpg')
obj.images.attach(io: File.open('./public/assets/casaco-de-zíper/download.jpg'),
filename: 'download.jpg')
obj.images.attach(io: File.open('./public/assets/casaco-de-zíper/images (3).jpg'), 
filename: 'images (3).jpg')
obj.images.attach(io: File.open('./public/assets/casaco-de-zíper/images.jpg'),
filename: 'images.jpg')

obj = Product.create!(name: 'Casaco moletom fechado', price: 22999, stock_quantity: 194, brand_id: 2, category_id: 1)
obj.images.attach(io: File.open('./public/assets/casaco-moletom-fechado/download (1).jpg'),
filename: 'download (1).jpg')
obj.images.attach(io: File.open('./public/assets/casaco-moletom-fechado/download (2).jpg'),
filename: 'download (2).jpg')
obj.images.attach(io: File.open('./public/assets/casaco-moletom-fechado/download.jpg'),
filename: 'download.jpg')
obj.images.attach(io: File.open('./public/assets/casaco-moletom-fechado/images.jpg'),
filename: 'images.jpg')

obj = Product.create!(name: 'Tênis de corrida turbo blaster', price: 45000, stock_quantity: 73, brand_id: 3, category_id: 2)
obj.images.attach(io: File.open('./public/assets/tênis-de-corrida/images (1).jpg'),
filename: 'images (1).jpg')
obj.images.attach(io: File.open('./public/assets/tênis-de-corrida/images (2).jpg'),
filename: 'images (2).jpg')
obj.images.attach(io: File.open('./public/assets/tênis-de-corrida/images (3).jpg'), 
filename: 'images (3).jpg')
obj.images.attach(io: File.open('./public/assets/tênis-de-corrida/images (4).jpg'),
filename: 'images (4).jpg')
obj.images.attach(io: File.open('./public/assets/tênis-de-corrida/images (5).jpg'),
filename: 'images (5).jpg')
obj.images.attach(io: File.open('./public/assets/tênis-de-corrida/images.jpg'), 
filename: 'images.jpg')

obj = Product.create!(name: 'Sapato naike SB', price: 33999, stock_quantity: 82, brand_id: 2, category_id: 2)
obj.images.attach(io: File.open('./public/assets/sapato-naike-SB/download (1).jpg'),
filename: 'download (1).jpg')
obj.images.attach(io: File.open('./public/assets/sapato-naike-SB/download (2).jpg'),
filename: 'download (2).jpg')
obj.images.attach(io: File.open('./public/assets/sapato-naike-SB/download (3).jpg'),
filename: 'download (3).jpg')
obj.images.attach(io: File.open('./public/assets/sapato-naike-SB/download (4).jpg'),
filename: 'download (4).jpg')
obj.images.attach(io: File.open('./public/assets/sapato-naike-SB/download (5).jpg'),
filename: 'download (5).jpg')
obj.images.attach(io: File.open('./public/assets/sapato-naike-SB/download.jpg'),
filename: 'download.jpg')

obj = Product.create!(name: 'Chuteira world prime versão CR7', price: 27599, stock_quantity: 89, brand_id: 2, category_id: 2)
obj.images.attach(io: File.open('./public/assets/chuteira/download (1).jpg'),
filename: 'download (1).jpg')
obj.images.attach(io: File.open('./public/assets/chuteira/download (2).jpg'),
filename: 'download (2).jpg')
obj.images.attach(io: File.open('./public/assets/chuteira/download (3).jpg'),
filename: 'download (3).jpg')
obj.images.attach(io: File.open('./public/assets/chuteira/download (4).jpg'),
filename: 'download (4).jpg')
obj.images.attach(io: File.open('./public/assets/chuteira/download (6).jpg'),
filename: 'download (6).jpg')
obj.images.attach(io: File.open('./public/assets/chuteira/download.jpg'),
filename: 'download.jpg')

obj = Product.create!(name: 'Meia esportiva cano alto', price: 1990, stock_quantity: 307, brand_id: 3, category_id: 3)
obj.images.attach(io: File.open('./public/assets/meia-esportiva-cano-alto/download (1).jpg'),
filename: 'download (1).jpg')
obj.images.attach(io: File.open('./public/assets/meia-esportiva-cano-alto/download (5).jpg'),
filename: 'download (5).jpg')
obj.images.attach(io: File.open('./public/assets/meia-esportiva-cano-alto/download.jpg'),
filename: 'download.jpg')
obj.images.attach(io: File.open('./public/assets/meia-esportiva-cano-alto/images (2).jpg'),
filename: 'images (2).jpg')
obj.images.attach(io: File.open('./public/assets/meia-esportiva-cano-alto/images (3).jpg'),
filename: 'images (3).jpg')
obj.images.attach(io: File.open('./public/assets/meia-esportiva-cano-alto/images.jpg'),
filename: 'images.jpg')

obj = Product.create!(name: 'Boné com blindagem ao sol', price: 2795, stock_quantity: 285, brand_id: 3, category_id: 3)
obj.images.attach(io: File.open('./public/assets/boné/images (1).jpg'),
filename: 'images (1).jpg')
obj.images.attach(io: File.open('./public/assets/boné/images (2).jpg'),
filename: 'images (2).jpg')
obj.images.attach(io: File.open('./public/assets/boné/images (4).jpg'),
filename: 'images (4).jpg')
obj.images.attach(io: File.open('./public/assets/boné/images (5).jpg'),
filename: 'images (5).jpg')
obj.images.attach(io: File.open('./public/assets/boné/images (6).jpg'),
filename: 'images (6).jpg')
obj.images.attach(io: File.open('./public/assets/boné/images.jpg'),
filename: 'images.jpg')

obj = Product.create!(name: 'Relógio de diamante', price: 50000000, stock_quantity: 1, brand_id: 4, category_id: 3)
obj.images.attach(io: File.open('./public/assets/relógio-de-diamante/download (1).jpg'),
filename: 'download (1).jpg')
obj.images.attach(io: File.open('./public/assets/relógio-de-diamante/download.jpg'),
filename: 'download.jpg')
obj.images.attach(io: File.open('./public/assets/relógio-de-diamante/images (1).jpg'),
filename: 'images (1).jpg')
obj.images.attach(io: File.open('./public/assets/relógio-de-diamante/images (2).jpg'),
filename: 'images (2).jpg')
obj.images.attach(io: File.open('./public/assets/relógio-de-diamante/images (3).jpg'),
filename: 'images (3).jpg')
obj.images.attach(io: File.open('./public/assets/relógio-de-diamante/images (4).jpg'),
filename: 'images (4).jpg')
obj.images.attach(io: File.open('./public/assets/relógio-de-diamante/images.jpg'),
filename: 'images.jpg')

obj = Product.create!(name: 'Relógio comum 34k de ouro', price: 1850000, stock_quantity: 6, brand_id: 4, category_id: 3)
obj.images.attach(io: File.open('./public/assets/relógio-de-ouro/images (1).jpg'),
filename: 'images (1).jpg')
obj.images.attach(io: File.open('./public/assets/relógio-de-ouro/images (2).jpg'),
filename: 'images (2).jpg')
obj.images.attach(io: File.open('./public/assets/relógio-de-ouro/images (3).jpg'),
filename: 'images (3).jpg')
obj.images.attach(io: File.open('./public/assets/relógio-de-ouro/images (4).jpg'),
filename: 'images (4).jpg')
obj.images.attach(io: File.open('./public/assets/relógio-de-ouro/images (8).jpg'),
filename: 'images (8).jpg')
obj.images.attach(io: File.open('./public/assets/relógio-de-ouro/images (9).jpg'),
filename: 'images (9).jpg')

obj = Product.create!(name: 'iNotebook versão 13', price: 1315020, stock_quantity: 37, brand_id: 5, category_id: 4)
obj.images.attach(io: File.open('./public/assets/iNotebook/download (1).jpg'),
filename: 'download (1).jpg')
obj.images.attach(io: File.open('./public/assets/iNotebook/download (2).jpg'),
filename: 'download (2).jpg')
obj.images.attach(io: File.open('./public/assets/iNotebook/download (3).jpg'),
filename: 'download (3).jpg')
obj.images.attach(io: File.open('./public/assets/iNotebook/download.jpg'),
filename: 'download.jpg')
obj.images.attach(io: File.open('./public/assets/iNotebook/images (1).jpg'),
filename: 'images (1).jpg')
obj.images.attach(io: File.open('./public/assets/iNotebook/images.jpg'),
filename: 'images.jpg')

obj = Product.create!(name: 'MaçãWatch IA integrada', price: 180000, stock_quantity: 22, brand_id: 5, category_id: 4)
obj.images.attach(io: File.open('./public/assets/maçãwatch/download (1).jpg'),
filename: 'download (1).jpg')
obj.images.attach(io: File.open('./public/assets/maçãwatch/download (2).jpg'),
filename: 'download (2).jpg')
obj.images.attach(io: File.open('./public/assets/maçãwatch/download (4).jpg'),
filename: 'download (4).jpg')
obj.images.attach(io: File.open('./public/assets/maçãwatch/download.jpg'),
filename: 'download.jpg')
obj.images.attach(io: File.open('./public/assets/maçãwatch/images (1).jpg'),
filename: 'images (1).jpg')
obj.images.attach(io: File.open('./public/assets/maçãwatch/images.jpg'),
filename: 'images.jpg')

obj = Product.create!(name: 'iCelular 14 versão limitada', price: 9999999, stock_quantity: 1, brand_id: 2, category_id: 2)
obj.images.attach(io: File.open('./public/assets/iCelular/download (1).jpg'),
filename: 'download (1).jpg')
obj.images.attach(io: File.open('./public/assets/iCelular/download (2).jpg'),
filename: 'download (2).jpg')
obj.images.attach(io: File.open('./public/assets/iCelular/download (4).jpg'),
filename: 'download (4).jpg')
obj.images.attach(io: File.open('./public/assets/iCelular/download (7).jpg'),
filename: 'download (7).jpg')
obj.images.attach(io: File.open('./public/assets/iCelular/download (8).jpg'),
filename: 'download (8).jpg')
obj.images.attach(io: File.open('./public/assets/iCelular/images.jpg'),
filename: 'images.jpg')

obj = Product.create!(name: 'Echo Dot', price: 31055, stock_quantity: 34, brand_id: 6, category_id: 4)
obj.images.attach(io: File.open('./public/assets/echo-dot/download (1).jpg'),
filename: 'download (1).jpg')
obj.images.attach(io: File.open('./public/assets/echo-dot/download (9).jpg'),
filename: 'download (9).jpg')
obj.images.attach(io: File.open('./public/assets/echo-dot/download.jpg'),
filename: 'download.jpg')
obj.images.attach(io: File.open('./public/assets/echo-dot/images (1).jpg'),
filename: 'images (1).jpg')
obj.images.attach(io: File.open('./public/assets/echo-dot/images (2).jpg'),
filename: 'images (2).jpg')
obj.images.attach(io: File.open('./public/assets/echo-dot/images.jpg'),
filename: 'images.jpg')

obj = Product.create!(name: 'Celular A12 128GB', price: 174035, stock_quantity: 45, brand_id: 6, category_id: 4)
obj.images.attach(io: File.open('./public/assets/celular-a12/download (1).jpg'),
filename: 'download (1).jpg')
obj.images.attach(io: File.open('./public/assets/celular-a12/download (2).jpg'),
filename: 'download (2).jpg')
obj.images.attach(io: File.open('./public/assets/celular-a12/download.jpg'),
filename: 'download.jpg')
obj.images.attach(io: File.open('./public/assets/celular-a12/images (1).jpg'),
filename: 'images (1).jpg')
obj.images.attach(io: File.open('./public/assets/celular-a12/images.jpg'),
filename: 'images.jpg')

obj = Product.create!(name: 'Fone Bluetooth inteligente', price: 16055, stock_quantity: 43, brand_id: 6, category_id: 4)
obj.images.attach(io: File.open('./public/assets/fone-bluetooth/download (1).jpg'),
filename: 'download (1).jpg')
obj.images.attach(io: File.open('./public/assets/fone-bluetooth/download (2).jpg'),
filename: 'download (2).jpg')
obj.images.attach(io: File.open('./public/assets/fone-bluetooth/download (4).jpg'),
filename: 'download (4).jpg')
obj.images.attach(io: File.open('./public/assets/fone-bluetooth/download.jpg'),
filename: 'download.jpg')
obj.images.attach(io: File.open('./public/assets/fone-bluetooth/images.jpg'),
filename: 'images.jpg')

obj = Product.create!(name: 'SmartTV 43 polegadas', price: 185907, stock_quantity: 39, brand_id: 6, category_id: 4)
obj.images.attach(io: File.open('./public/assets/smart-tv/download (1).jpg'),
filename: 'download (1).jpg')
obj.images.attach(io: File.open('./public/assets/smart-tv/download (2).jpg'),
filename: 'download (2).jpg')
obj.images.attach(io: File.open('./public/assets/smart-tv/download (3).jpg'),
filename: 'download (3).jpg')
obj.images.attach(io: File.open('./public/assets/smart-tv/download (6).jpg'),
filename: 'download (6).jpg')
obj.images.attach(io: File.open('./public/assets/smart-tv/images.jpg'),
filename: 'images.jpg')

obj = User.create!(name: 'Vil4rim', email:'paulo@paulo', password: 'batata')
obj.profile_picture.attach(io: File.open('./public/assets/profile pictures/vil4rim.jpg'),
filename: 'vil4rim.jpg')
Cart.create(user_id: obj.id)

obj = User.create!(name: 'denial', email:'daniel@daniel', password: 'batata')
obj.profile_picture.attach(io: File.open('./public/assets/profile pictures/denial.jpg'),
filename: 'denial.jpg')
Cart.create(user_id: obj.id)

obj = User.create!(name: 'Admin', email: 'admin@admin', password: '123456', is_admin: true)
obj.profile_picture.attach(io: File.open('./public/assets/profile pictures/admin.jpg'),
filename: 'admin.jpg')
Cart.create(user_id: obj.id)
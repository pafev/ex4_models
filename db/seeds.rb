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

Product.create!(name: 'Vestido longo de prada', price: 120000, stock_quantity: 50, brand_id: 1, category_id: 1)
Product.create!(name: 'Bolsa luxuosa de veludo', price: 200000, stock_quantity: 24, brand_id: 1, category_id: 3)
Product.create!(name: 'Calça moletom', price: 24999, stock_quantity: 200, brand_id: 3, category_id: 1)
Product.create!(name: 'Camisa térmica comprida', price: 8999, stock_quantity: 243, brand_id: 2, category_id: 1)
Product.create!(name: 'Casaco de zíper', price: 14999, stock_quantity: 205, brand_id: 3, category_id: 1)
Product.create!(name: 'Casaco moletom fechado', price: 22999, stock_quantity: 194, brand_id: 2, category_id: 1)
Product.create!(name: 'Tênis de corrida turbo blaster', price: 45000, stock_quantity: 73, brand_id: 3, category_id: 2)
Product.create!(name: 'Sapato naike SB', price: 33999, stock_quantity: 82, brand_id: 2, category_id: 2)
Product.create!(name: 'Chuteira world prime versão CR7', price: 27599, stock_quantity: 89, brand_id: 2, category_id: 2)
Product.create!(name: 'Meia esportiva cano alto', price: 1990, stock_quantity: 307, brand_id: 3, category_id: 3)
Product.create!(name: 'Boné com blindagem ao sol', price: 2795, stock_quantity: 285, brand_id: 3, category_id: 3)
Product.create!(name: 'Relógio de diamante', price: 50000000, stock_quantity: 1, brand_id: 4, category_id: 3)
Product.create!(name: 'Relógio comum 34k de ouro', price: 1850000, stock_quantity: 6, brand_id: 4, category_id: 3)
Product.create!(name: 'iNotebook versão 13', price: 1315020, stock_quantity: 37, brand_id: 5, category_id: 4)
Product.create!(name: 'MaçãWatch IA integrada', price: 180000, stock_quantity: 22, brand_id: 5, category_id: 4)
Product.create!(name: 'iCelular 14 versão limitada', price: 9999999, stock_quantity: 1, brand_id: 2, category_id: 2)
Product.create!(name: 'Echo Dot', price: 31055, stock_quantity: 34, brand_id: 6, category_id: 4)
Product.create!(name: 'Celular A12 128GB', price: 174035, stock_quantity: 45, brand_id: 6, category_id: 4)
Product.create!(name: 'Fone Bluetooth inteligente', price: 16055, stock_quantity: 43, brand_id: 6, category_id: 4)
Product.create!(name: 'SmartTV 43 polegadas', price: 185907, stock_quantity: 39, brand_id: 6, category_id: 4)

User.create!(name: 'Vil4rim', email:'paulo@paulo', password: 'batata')
User.create!(name: 'denial', email:'daniel@daniel', password: 'batata')
User.create!(name: 'Admin', email: 'admin@admin', password: '123456', is_admin: true)
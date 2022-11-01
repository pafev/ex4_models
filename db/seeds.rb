# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!(name: 'Roupas')
Category.create!(name: 'Eletrônicos')
Category.create!(name: 'Acessórios')
Category.create!(name: 'Sapatos')

Brand.create!(name: 'Lacoste')
Brand.create!(name: 'Apple')
Brand.create!(name: 'Rolex')
Brand.create!(name: 'Adidas')
Brand.create!(name: 'Samsung')
Brand.create!(name: 'Nike')

Product.create!(name: 'Celular A12', price: 180000, stock_quantity: 50, brand_id: 5, category_id: 2)
Product.create!(name: 'AppleWatch', price: 200000, stock_quantity: 24, brand_id: 2, category_id: 2)
Product.create!(name: 'Tênis Nike SB', price: 44999, stock_quantity: 200, brand_id: 6, category_id: 4)
Product.create!(name: 'Relógio Rolex Oyster', price: 3500000, stock_quantity: 5, brand_id: 3, category_id: 3)
Product.create!(name: 'Camiseta Térmica', price: 8999, stock_quantity: 205, brand_id: 4, category_id: 1)
Product.create!(name: 'Calça Moletom Adidas', price: 14999, stock_quantity: 163, brand_id: 4, category_id: 1 )
Product.create!(name: 'Camiseta Polo Lacoste', price: 27599, stock_quantity: 89, brand_id: 1, category_id: 1)
Product.create!(name: 'Relógio Lacoste', price: 55000, stock_quantity: 13, brand_id: 1, category_id: 3)
Product.create!(name: 'Echo Dot Samsung', price: 69999, stock_quantity: 17, brand_id: 5, category_id: 2)
Product.create!(name: 'iPhone 15', price: 9999999, stock_quantity: 1, brand_id: 2, category_id: 2)
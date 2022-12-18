class PurchaseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :cart_id, :product_data, :value
end

def product_data
  product_purchase = Product.find(product_id)
  image = rails_blob_path(product_purchase.images[0], only_path: true) if product_purchase.images.attached?
  {id: product_id, name: product_purchase.name, stock_quantity: product_purchase.stock_quantity, image_url: image }
end

def value
  product_purchase = Product.all.select { |product| product.id == product_id }
  product_purchase[0].price
end
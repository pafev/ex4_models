class PurchaseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :cart_id, :product_id, :value
end

def value
  product_purchase = Product.all.select { |product| product.id == product_id }
  product_purchase[0].price
end
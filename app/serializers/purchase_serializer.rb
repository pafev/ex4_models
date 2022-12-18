class PurchaseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :product, :value, :cart_id
end
def product:
  {name: object.product.name, stock: object.product.stock, category_id: object.product.category_id, brand_id: object.product.brand_id}
end
def image_url:
  firstImage = nil
  if object.images.attached?
    firstImage = rails_blob_path(object.images[0], only_path: true)
  end
  firstImage
end
def value: 
  {price: object.product.price,}
end  
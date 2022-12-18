class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :product, :cart_id
end
def product:
  {id: object.product.id, name: object.product.name, price: object.product.price, stock: object.product.stock, category_id: object.product.category_id, brand_id: object.product.brand_id}

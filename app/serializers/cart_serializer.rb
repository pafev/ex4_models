class CartSerializer < ActiveModel::Serializer
  attributes :id, :value, :user

  def value
    totalValue = 0
    object.purchases.each do |purchase|
      product = Product.find(purchase.product_id)
      totalValue += product.price
    end
    totalValue
  end

  def user
    {id: object.user.id, name: object.user.name, email: object.user.email, is_admin: object.user.is_admin, credit_wallet: object.user.credit_wallet}
  end
end

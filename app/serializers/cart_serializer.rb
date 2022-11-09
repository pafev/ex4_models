class CartSerializer < ActiveModel::Serializer
  attributes :id, :total_value, :user
  def user
    {id: object.user.id, name: object.user.name, email: object.user.email, is_admin: object.user.is_admin, credit_wallet: object.user.credit_wallet}
  end
end

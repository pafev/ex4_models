class CartSerializer < ActiveModel::Serializer
  attributes :id, :total_value, :user
  def user
    object.user
  end
end

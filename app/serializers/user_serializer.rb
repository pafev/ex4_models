class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :is_admin, :credit_wallet, :email, :authentication_token, :addresses, :cart, :profile_picture_url
  
  def cart
    if object.cart
      {id: object.cart.id, total_value: object.cart.total_value}
    end
  end
  def addresses
    array_sem_edit = Address.select { |user_address| user_address.user_id = object.id }
    array_com_edit = []
    for address in array_sem_edit
      array_com_edit.push({id: address.id, description: address.description})
    end
    array_com_edit
  end  
  
  def profile_picture_url
    rails_blob_path(object.profile_picture, only_path: true) if object.profile_picture.attached?
  end
end

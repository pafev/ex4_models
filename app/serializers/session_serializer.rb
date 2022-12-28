class SessionSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :credit_wallet, :authentication_token 
end

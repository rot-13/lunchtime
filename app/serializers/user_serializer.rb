class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :email, :avatar_url
end
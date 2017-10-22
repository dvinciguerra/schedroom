class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :first_name, :last_name, :email, :profile_image

end

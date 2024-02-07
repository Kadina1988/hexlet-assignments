class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :address, :full_name

  has_many :posts

  def full_name
    "#{self.object.first_name} #{self.object.last_name}"
  end
end

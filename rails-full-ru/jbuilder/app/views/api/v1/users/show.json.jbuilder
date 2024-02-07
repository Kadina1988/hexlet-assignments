json.extract! @user, :id, :email, :address, :first_name, :last_name
json.posts do
  json.array! @posts, partial: 'post', as: :post
end






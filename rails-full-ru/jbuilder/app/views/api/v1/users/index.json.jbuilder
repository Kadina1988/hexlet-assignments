# json.array! @users, :id, :email, :address, :first_name, :last_name
json.array!(@users) do |user|
  json.id user.id
  json.email user.email
  json.address user.address
  json.full_name ("#{user.first_name} #{user.last_name}")
  json.posts(user.posts) do |post|
    json.id post.id
    json.title post.title
  end
end








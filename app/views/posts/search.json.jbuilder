json.array! @posts do |post|
  json.id post.id
  json.food_image post.food_image
  json.shop_name post.shop_name
  json.user_id post.user_id
  json.user_name post.user.user_name
  json.user_sign_in current_user
end
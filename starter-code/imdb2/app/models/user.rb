# **Student 2** should create a new branch called `review-user-models` and fill in the Review and an User models:
#   - Reviews belong to movies; they also belong to users
#   - Users have many reviews
#   - The user model should have a `full_name` method that returns an interpolated string with the user's `first_name` and `last_name`

class User < ActiveRecord::Base
  has_many :reviews

  def full_name(first_name, last_name)
    first_name + last_name
  end

end

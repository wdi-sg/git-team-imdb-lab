class Actor < ActiveRecord::Base
  def age
    @age = Time.now.year - year_of_birth
  end
end

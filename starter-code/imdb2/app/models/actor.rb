class Actor < ActiveRecord::Base
  has_and_belongs_to_many :movies

  def age
    self.year_of_birth - Time.now.year
  end
end

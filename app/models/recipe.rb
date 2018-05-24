class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients

  # def unique
  #   self.ingredients.uniq
  # end
end

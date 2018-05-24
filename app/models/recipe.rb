class Recipe < ActiveRecord::Base
  has_many :ingredients 
  accepts_nested_attributes_for :ingredients
  # you pass in the i, because ingredients attributes will 
  # look like 
  # {"0" => {hash}, "1" => {hash}} 
  # instead of an array of hashes, it's a hash with ascending
  # string keys of the "indexes" 
  # this is because of fields_for, it generates hashes like this
  # this MUST be called thing_attributes for fields_for to 
  # generate form names properly
  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.each do |i, ingredient_attributes|
      self.ingredients.build(ingredient_attributes)
    end 
  end 

end

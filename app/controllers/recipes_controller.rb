class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: "yum")
    @recipe.ingredients.build(name: "yummy")
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save

    redirect_to @recipe
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, ingredients_attributes:[:name, :quantity])
  end

end

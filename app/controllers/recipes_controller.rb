class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(recipe: @recipe) 
    @recipe.ingredients.build(recipe: @recipe) 
  end

  def create
    recipe = Recipe.new(recipe_params)
    recipe.save 

    redirect_to recipe
  end


  private 

    def set_recipe 

    end 
    def recipe_params
     #  "recipe"=>{
      #     "title"=>"hammy sammy ammy", 
      #     "ingredients_attributes"=>{
      #        "0"=>{"name_1"=>"cheese ", "quantity_1"=>"11"}, 
      #        "1"=>{"name_2"=>"ham", "quantity_2"=>"22"}
      #      }
      #  }
      params.require(:recipe).permit(:title, :ingredients_attributes => [:name, :quantity])
    end 
end

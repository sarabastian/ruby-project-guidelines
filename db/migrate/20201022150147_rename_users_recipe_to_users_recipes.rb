class RenameUsersRecipeToUsersRecipes < ActiveRecord::Migration[6.0]
  def change
    rename_table :users_recipe, :users_recipes
  end
end

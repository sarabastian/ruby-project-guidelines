require 'rest-client'
require 'json'
require 'pry'
require_relative '../lib/command_line_interface'




# # #getting an array of recipes from the api, based on user input of ingredients
def get_recipe_titles(user_ingredients)
    
    search_params = 'http://www.recipepuppy.com/api/?i=' + user_ingredients.join(",")
  

    recipes = []
    search_string = RestClient.get(search_params)
    search_hash = JSON.parse(search_string)
    relevant_recipes = search_hash["results"]
    relevant_recipes.collect do |recipe|
        recipes << recipe["title"].strip
    end
    
    recipes
end

#order recipes in a list based on result (an array) from get_recipe_titles
def order_recipe_titles(placeholder_array)
    title_array = []
    placeholder_array.each_with_index do |title, index|
        title_array << "#{index+1}. #{title}"
    end
    title_array
end



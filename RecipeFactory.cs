using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace sdaproject
{
    public class Recipe
    {
        public int UserId { get; set; }
        public string RecipeName { get; set; }
        public string Category { get; set; }
        public string Ingredients { get; set; }
        public string StepsToCook { get; set; }
        public DateTime DateCreated { get; set; }
    }
    public interface IRecipeFactory
    {
        Recipe CreateRecipe(int userId, string name, string category, string ingredients, string steps);
    }

    public class RecipeFactory : IRecipeFactory
    {
        public Recipe CreateRecipe(int userId, string name, string category, string ingredients, string steps)
        {
            return new Recipe
            {
                UserId = userId,
                RecipeName = name,
                Category = category,
                Ingredients = ingredients,
                StepsToCook = steps,
                DateCreated = DateTime.Now
            };
        }
    }
}
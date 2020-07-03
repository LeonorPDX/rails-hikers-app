# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) -- Trailheads has many hikes
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) -- Hikes belong to trailhead and belongs to user
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) -- Trailheads has many users through check-ins, and vice-versa
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) -- Trailheads have many users, users have many trailheads
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) -- Check-ins have a datetime attribute that is submitted by the user
- [ ] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include signup (how e.g. Devise) -- Devise generate user model and signup routes, views, controller actions, etc 
- [x] Include login (how e.g. Devise) -- Again, made with Devise
- [x] Include logout (how e.g. Devise) -- Same, made with Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) -- Able to sign up with Facebook or Github
- [x] Include nested resource show or index (URL e.g. users/2/recipes) -- Nested hike show page under trailhead
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
# Specifications for the Rails Assessment

Specs:
- [X] Using Ruby on Rails for the project -> Used Ruby on Rails
- [X] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) -> project contains multiple has_many relationships, ex. User has_many Comments
- [X] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) -> project contains multiple belongs_to relationships, ex. Comment belongs_to Recipe
- [X] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) -> User has_many Recipes through Comments, Recipe has_many Users through Comments
- [X] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) -> User has_many Recipes through Comments, Recipe has_many Users through Comments
- [X] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) -> Comments have a title, body, and rating
- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) -> basic validations exist for most models
- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) -> project contains a search scope model using .where
- [X] Include signup (how e.g. Devise) -> project has signup function
- [X] Include login (how e.g. Devise) -> project has login function
- [X] Include logout (how e.g. Devise) -> project has logout function
- [X] Include third party signup/login (how e.g. Devise/OmniAuth) -> project has Google Oauth function
- [X] Include nested resource show or index (URL e.g. users/2/recipes) -> project has nested resources for comments by recipe, recipes/1/comments
- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) -> project has nested resources for comments by recipe, recipes/1/comment/new
- [X] Include form display of validation errors (form URL e.g. /recipes/new) -> project displays validation errors and flash notice messages

Confirm:
- [X] The application is pretty DRY -> used form partials
- [X] Limited logic in controllers -> extended logic to models
- [X] Views use helper methods if appropriate -> helper methods are used throughout views
- [X] Views use partials if appropriate -> new and edit partial forms
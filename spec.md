# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
     * A program has_many videos
     * A program has_many program_videos
     * A video has_many program_videos
     * A student has_many libray_items
     * A program has_many library_items

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    * A program belongs_to a teacher

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    * student has_many :teachers through: :programs
    * student has_many :programs, through: :library_items
    * teacher has_many :students, through: :programs 
    * program has_many :videos, through: :program_videos

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    * a student has_many programs through library_items. 
    * and a program has_many students through library_items.

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    * student is able to favorite a library_item ( the join table between student and program)

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    * Validates presence of name and tile for propgrams and videos

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    * Program uses where to find programs by teacher

- [x] Include signup (how e.g. Devise)
    * Implmented my own first, then I used Devise

- [x] Include login (how e.g. Devise)
    * Implmented my own first, then I used Devise

- [x] Include logout (how e.g. Devise)
    * Implmented my own first, then I used Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    * Implmented my own first, then I used Devise

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    * there are nested rescources for both teachers and student to access programs
        students/1/programs
        teachers/2/programs
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    * A teacher can create a new video or a program through a nested rescource
        teachers/1/programs/new
        teachers/1/videos/new

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    
Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate

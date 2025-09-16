**Meal Recipe App Database**
**Description**

This project is a relational database system for a Meal Recipe App. It allows users to create accounts, view recipes (including Kenyan and international recipes), track ingredients and save favorite recipes.

**Database Features**

**Users**: Stores user account details.

**Categories**: Stores recipe categories (Breakfast, Lunch, Dinner, Dessert).

**Recipes**: Stores recipes created by users with descriptions and category.

**Ingredients**: Stores ingredients for recipes.

**Recipe_Ingredients**: Connects recipes to ingredients (Many-to-Many).

**Favorites**: Tracks recipes saved by users (Many-to-Many).

**Relationships**

One-to-Many: Users → Recipes, Categories → Recipes

Many-to-Many: Recipes ↔ Ingredients, Users ↔ Recipes (Favorites)

**Constraints**

Primary Keys (PK), Foreign Keys (FK), NOT NULL, UNIQUE enforced for data integrity.

ON DELETE CASCADE ensures relational consistency.

**How to Use**

Open MySQL Workbench and connect to your MySQL server.

Run the MealRecipeApp.sql script to create the database, tables and sample data.

Verify tables by running SHOW TABLES;.

Query the database to fetch recipes, ingredients, or favorites.


**Sample Queries**

**Fetch all recipes:**

SELECT * FROM Recipes;


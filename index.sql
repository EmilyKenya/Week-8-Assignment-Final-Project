CREATE DATABASE MealRecipeApp;


-- TABLES

-- Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Categories Table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);


-- Recipes Table
CREATE TABLE Recipes (
    recipe_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    category_id INT NOT NULL,
    recipe_name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE CASCADE
);

-- Ingredients Table
CREATE TABLE Ingredients (
    ingredient_id INT AUTO_INCREMENT PRIMARY KEY,
    ingredient_name VARCHAR(100) NOT NULL UNIQUE
);

-- Recipe_Ingredients Table (Many-to-Many)
CREATE TABLE Recipe_Ingredients (
    recipe_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    quantity VARCHAR(50),
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id) ON DELETE CASCADE,
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id) ON DELETE CASCADE
);

-- Favorites Table (Users saving Recipes)
CREATE TABLE Favorites (
    user_id INT NOT NULL,
    recipe_id INT NOT NULL,
    PRIMARY KEY (user_id, recipe_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id) ON DELETE CASCADE
);

-- ===========================
-- SAMPLE DATA
-- ===========================

-- Users
INSERT INTO Users (username, email, password) VALUES
('alice', 'alice@example.com', 'password123'),
('bob', 'bob@example.com', 'password123'),
('carol', 'carol@example.com', 'password123');

-- Categories
INSERT INTO Categories (category_name) VALUES
('Breakfast'),
('Lunch'),
('Dinner'),
('Dessert');

-- Ingredients
INSERT INTO Ingredients (ingredient_name) VALUES
('Eggs'),
('Flour'),
('Sugar'),
('Milk'),
('Chicken'),
('Rice'),
('Tomato'),
('Cheese'),
('Maize Flour'),   -- for Ugali
('Sukuma Wiki'),   -- collard greens
('Salt'),
('Beef'),
('Oil');           -- for frying Mandazi

-- Recipes (International + Kenyan)
INSERT INTO Recipes (user_id, category_id, recipe_name, description) VALUES
(1, 1, 'Pancakes', 'Fluffy pancakes perfect for breakfast.'),
(2, 2, 'Chicken Rice', 'Delicious chicken with steamed rice.'),
(3, 4, 'Chocolate Cake', 'Rich and moist chocolate cake.'),
(1, 2, 'Ugali with Sukuma Wiki', 'Traditional Kenyan maize meal with collard greens.'),
(2, 3, 'Nyama Choma', 'Grilled meat, a favorite at Kenyan gatherings.'),
(3, 4, 'Mandazi', 'Sweet fried dough, perfect as a snack or breakfast.');

-- Recipe_Ingredients (International + Kenyan)
INSERT INTO Recipe_Ingredients (recipe_id, ingredient_id, quantity) VALUES
-- Pancakes
(1, 1, '2 eggs'),
(1, 2, '1 cup'),
(1, 4, '1 cup milk'),
(1, 3, '2 tbsp sugar'),
-- Chicken Rice
(2, 5, '200g chicken'),
(2, 6, '1 cup rice'),
(2, 7, '1 tomato'),
-- Chocolate Cake
(3, 2, '2 cups flour'),
(3, 3, '1 cup sugar'),
(3, 4, '1 cup milk'),
(3, 8, '100g cheese'),
-- Ugali with Sukuma Wiki
(4, 9, '2 cups'),       -- Maize Flour
(4, 10, '1 bunch'),     -- Sukuma Wiki
(4, 11, '1 tsp'),       -- Salt
-- Nyama Choma
(5, 12, '500g'),        -- Beef
(5, 11, '1 tsp'),       -- Salt
-- Mandazi
(6, 2, '2 cups'),       -- Flour
(6, 3, '1/2 cup'),      -- Sugar
(6, 13, '1/4 cup');     -- Oil

-- Favorites (Users saving recipes)
INSERT INTO Favorites (user_id, recipe_id) VALUES
(1, 2),  -- Alice likes Chicken Rice
(1, 4),  -- Alice likes Ugali with Sukuma Wiki
(2, 3),  -- Bob likes Chocolate Cake
(2, 5),  -- Bob likes Nyama Choma
(3, 1),  -- Carol likes Pancakes
(3, 6);  -- Carol likes Mandazi

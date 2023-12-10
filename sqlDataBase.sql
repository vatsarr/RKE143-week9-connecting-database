CREATE DATABASE myrecipes;

CREATE TABLE
    recipe (id SERIAL PRIMARY KEY, recipeName VARCHAR(55));

INSERT INTO
    recipe (recipeName)
VALUES
    ('Pumpkin Pasties'),
    ('Pumpkin Tartlets'),
    ('Creamy Pumpkin Soup');

CREATE TABLE
    ingredient (id SERIAL PRIMARY KEY, ingredientName VARCHAR(55));

INSERT INTO
    ingredient (ingredientName)
VALUES
    ('pumpkin puree'),
    ('sugar'),
    ('cinnamon'),
    ('nutmeg'),
    ('cloves'),
    ('Pastry dough'),
    ('Egg wash (1 egg beaten with a splash of milk)'),
    ('brown sugar'),
    ('ginger'),
    ('Mini tart shells'),
    ('Whipped cream for garnish'),
    ('onion, chopped'),
    ('garlic, minced'),
    ('vegetable broth'),
    ('heavy cream'),
    ('Salt and pepper to taste');

CREATE TABLE
    ingredientInRecipe (
        id SERIAL PRIMARY KEY,
        recipeId INTEGER,
        ingredientId INTEGER,
        FOREIGN KEY (recipeId) REFERENCES recipe (id),
        FOREIGN KEY (ingredientId) REFERENCES ingredient (id)
    );

INSERT INTO
    ingredientInRecipe (recipeId, ingredientId)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (1, 6),
    (1, 7),
    (2, 1),
    (2, 8),
    (2, 9),
    (2, 3),
    (2, 4),
    (2, 10),
    (2, 11),
    (3, 1),
    (3, 12),
    (3, 5),
    (3, 14),
    (3, 15),
    (3, 16);

INSERT INTO
    ingredientInRecipe (recipeId, ingredientId)
SELECT
    a.id,
    b.id
FROM
    recipe a
    JOIN ingredient b ON a.recipeName = 'Pumpkin Pasties'
    AND b.ingredientName = 'cloves';

SELECT
    a.recipeName,
    b.ingredientName
FROM
    recipe a
    INNER JOIN ingredientInRecipe c ON a.id = c.recipeId
    INNER JOIN ingredient b ON b.id = c.ingredientId;

SELECT
    *
FROM
    recipe;

SELECT
    *
FROM
    ingredient;
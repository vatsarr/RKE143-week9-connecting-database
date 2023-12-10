const express = require("express");
const db = require("./db");
const recipesRouter = require("./routes/recipes.routes.js");
const ingredientsRouter = require("./routes/ingredients.routes.js");

const app = express();
const port = 3000;

app.get("/", (req, res) => {
    res.render("index");
});

app.use("/recipes", recipesRouter);

app.use("/ingredients", ingredientsRouter);

app.listen(port, () => console.log(`Example app listening on port ${port}!`));

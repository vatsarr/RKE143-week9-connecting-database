const express = require("express");
const router = express.Router();
const db = require("../db");

router.get("/", async (req, res) => {
    const recipes = await db.query("SELECT * FROM recipe;");
    console.log(recipes.rows);
    res.json(recipes.rows);
});

module.exports = router;

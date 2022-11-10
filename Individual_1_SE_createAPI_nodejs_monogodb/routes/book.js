const bookController = require("../controllers/bookController");
const router = require("express").Router();

//add a book
router.post("/",bookController.addabook);
//get all book
router.get("/",bookController.getallbooks);

module.exports = router;
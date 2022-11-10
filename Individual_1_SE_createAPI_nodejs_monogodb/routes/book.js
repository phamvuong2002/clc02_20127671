const bookController = require("../controllers/bookController");
const router = require("express").Router();

//add a book
router.post("/",bookController.addabook);
//get all book
router.get("/",bookController.getallbooks);
//get a book
router.get("/:id_book",bookController.getabook);
//update a book
router.put("/:id_book",bookController.updateabook);
module.exports = router;
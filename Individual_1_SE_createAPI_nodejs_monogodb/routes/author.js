const authorController = require("../controllers/authorController");

const router = require("express").Router();

//add author
router.post("/",authorController.addAuthor);

//get all authors
router.get("/",authorController.getallAuthors);

//get an author
router.get("/:id_author",authorController.getanAuthor);

//delete a author
router.delete("/:id_author",authorController.deleteaAuthor);

module.exports = router;
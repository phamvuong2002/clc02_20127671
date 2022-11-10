const {Author,Book} = require("../model/model");

const authorController = { // controller for Author
    //add author
    addAuthor : async(req,res) => {
        try{
            const newAuthor = new Author(req.body);
            const saveAuthor = await newAuthor.save();
            res.status(200).json(saveAuthor);
        }catch(err){
            res.status(500).json(err);
        }
    },
    // get all authors
    getallAuthors : async(req,res) =>{
        try{
            const authors = await Author.find();
            res.status(200).json(authors);
        }catch(err){
            res.status(500).json(err);
        }
    },
    //get an author
    getanAuthor : async(req,res) =>{
        try{
            const author = await Author.findById(req.params.id_author).populate("books");
            res.status(200).json(author);
        }catch(err){
            res.status(500).json(err);
        }
    },
};
module.exports = authorController;
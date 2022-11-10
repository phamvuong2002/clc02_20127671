const {Book,Author} = require("../model/model");

const bookController = {
    //add a book
    addabook : async(req,res) => {
        try {
            const newBook = new Book(req.body);
            const saveBook = await newBook.save();
            if(req.body.author){
                const author = Author.findById(req.body.author);
                await author.updateOne({$push: {books: saveBook._id}})
            }
            res.status(200).json(saveBook);
        }catch(err){
            res.status(500).json(err);
        }
    },
    //get all books
    getallbooks :async(req,res) =>{
        try{
            const books = await Book.find();
            res.status(200).json(books);
        }catch(err){
            res.status(500).json(err);
        }
    },
    //get a book
    getabook : async(req,res) =>{
        try{
            const book = await Book.findById(req.params.id_book).populate("author");
            res.status(200).json(book);
        }catch(err){
            res.status(500).json(err);
        }
    },
    //update a book
    updateabook : async (req,res) =>{
        try{
            const book = await Book.findById(req.params.id_book);
            await book.updateOne({ $set: req.body});
            res.status(200).json("Updated Successfully!");
        }catch(err){
            res.status(500).json(err);
        }
    },
    //delete a book
    deleteABook : async (req,res) => {
        try{
            await Author.updateMany(
                {books: req.params.id_book},
                {$pull: {books: req.params.id_book}}
            );
            await Book.findByIdAndDelete(req.params.id_book);
            res.status(200).json("Deleted Successfully!");
        }catch(err){
            res.status(500).json(err);
        }
    }
};

module.exports = bookController;
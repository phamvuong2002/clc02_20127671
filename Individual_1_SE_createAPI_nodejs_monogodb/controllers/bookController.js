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
    
};

module.exports = bookController;
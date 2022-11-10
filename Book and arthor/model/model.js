// tao khung cho database
//vd book co nhung truong nao
// arthor co nhung truong nao

//create schema
const mongoose = require("mongoose");

const authorSchema = new mongoose.Schema({
    name:{
        type:String
    },
    year:{
        type:Number
    },
    books:[
        {
            type: mongoose.Schema.Types.ObjectId,
            ref:"Book",// reference to Book
        },
    ],
});

const bookSchema = new mongoose.Schema({
    name:{
        type:String,
        require:true 
    },
    publishedDate:{
        type:String,
    },
    genres:{
        type:[String]
    },
    author:{
        type : mongoose.Schema.Types.ObjectId,
        ref:"Author", // reference to Author
    },
});

let Book = mongoose.model("Book",bookSchema);
let Author = mongoose.model("Author",authorSchema);
module.exports = {Book, Author};
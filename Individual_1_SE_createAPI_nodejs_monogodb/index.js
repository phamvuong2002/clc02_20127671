//declare
const express = require("express");
const cors = require("cors");
const mongoose = require("mongoose");
const morgan = require("morgan");
const dotenv = require("dotenv");
const app = express();
var bodyParser = require("body-parser")//body-parser use to post json

//declare router
const authorRouter = require("./routes/author");
const bookRouter = require("./routes/book");

dotenv.config();
// create database
mongoose.connect((process.env.MONOGODB_URL),() => {
    console.log("Connected to MonogoDB")
})

app.use(bodyParser.json({limit:"50mb"}));
app.use(cors());
app.use(morgan("common"));



//Routers
app.use("/v1/author", authorRouter);
app.use("/v1/book", bookRouter);

app.listen(8000, () =>  {
    console.log("Server is running...");
})
'use strict';

const AuthorsData = require('../data/authors');

const get_all_authors = async (req, res, next) => {
    try {

        const authorslist = await AuthorsData.getAllAuthors();
        res.send(authorslist);        
    } catch (error) {
        res.status(400).send(error.message);
    }
}
const get_author_byID = async (req, res, next) => {
    try {
        const authorid = req.params.id;
        const author = await AuthorsData.getAuthorById(authorid);
        res.send(author);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const get_author_byLikeName = async (req, res, next) => {
    try {
        const likename = req.params.id;
        const authors = await AuthorsData.getAuthorsByLikeName(likename);
        res.send(authors);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const create_Author = async (req, res, next) => {
    try {
        const data = req.body;
        const inserted = await AuthorsData.createAuthor(data);
        res.send(inserted);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const update_Author = async (req, res, next) => {
    try {
        const authorid =  req.params.id;
        const data = req.body;
        const updated = await AuthorsData.updateAuthor(authorid, data);
        res.send(updated);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const delete_Author = async (req, res, next) => {
    try {
        const authorid = req.params.id;
        const deleted = await AuthorsData.deleteAuthor(authorid);
        res.send(deleted);
    } catch (error) {
        res.status(400).send(error.message);
    }
}
module.exports = {
    get_all_authors, get_author_byID, get_author_byLikeName, create_Author, update_Author, delete_Author
}
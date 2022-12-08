'use strict';

const express = require('express');
const AuthorsControll = require('../controllers/AuthorsController');
const router = express.Router();

router.get('/getauthors', AuthorsControll.get_all_authors);
router.get('/getauthor/:id', AuthorsControll.get_author_byID);
router.get('/searchauthors/:id', AuthorsControll.get_author_byLikeName);
router.post('/addauthor', AuthorsControll.create_Author);
router.put('/updateauthor/:id', AuthorsControll.update_Author);
router.delete('/deleteauthor/:id', AuthorsControll.delete_Author);
module.exports = {
    routes: router
}
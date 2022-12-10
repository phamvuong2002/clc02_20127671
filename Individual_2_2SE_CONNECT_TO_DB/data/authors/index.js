'use strict';
const utils = require('../utils');
const config = require('../../config');
const sql = require('mssql');

const getAllAuthors = async () => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('authors');
        const authorsList = await pool.request().query(sqlQueries.getauthors);
        return authorsList.recordset;
    } catch (error) {
        console.log(error.message);
    }
}
const getAuthorById = async(authorID) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('authors');
        const author = await pool.request()
                            .input('authorid', sql.Char(10), authorID)
                            .query(sqlQueries.getauthorbyid);
        return author.recordset;
    } catch (error) {
        return error.message;
    }
}

const getAuthorsByLikeName = async(likename) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('authors');
        const authors = await pool.request()
                            .input('likename', sql.VarChar(30), likename)
                            .query(sqlQueries.getauthorbylikename);
        return authors.recordset;
    } catch (error) {
        return error.message;
    }
}

const createAuthor = async (data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('authors');
        const insert = await pool.request()
                            .input('authorid', sql.Char(10), data.authorid)
                            .input('adminid', sql.Char(10), data.adminid)
                            .input('editorid', sql.Char(10), data.editorid)
                            .input('password', sql.Char(15), data.password)
                            .input('authorname', sql.Char(20), data.authorname)
                            .input('email', sql.Char(30), data.email)
                            .input('address', sql.Char(30), data.address)
                            .input('phonenumber', sql.Char(15), data.phonenumber)
                            .input('accountnumber', sql.Char(15), data.accountnumber)
                            .input('salary', sql.Int, data.salary)
                        .query(sqlQueries.createauthor);
        return insert.recordset;
    } catch (error) {
        return error.message;
    }
}

const updateAuthor = async (authorid, data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('authors');
        const update = await pool.request()
                            .input('authorid', sql.Char(10), authorid)
                            .input('adminid', sql.Char(10), data.adminid)
                            .input('editorid', sql.Char(10), data.editorid)
                            .input('password', sql.Char(15), data.password)
                            .input('authorname', sql.Char(20), data.authorname)
                            .input('email', sql.Char(30), data.email)
                            .input('address', sql.Char(30), data.address)
                            .input('phonenumber', sql.Char(15), data.phonenumber)
                            .input('accountnumber', sql.Char(15), data.accountnumber)
                            .input('salary', sql.Int, data.salary)
                            .input('unpair', sql.Int, data.unpair)
                        .query(sqlQueries.updateauthor);
        return update.recordset;
    } catch (error) {
        return error.message;
    }
}

const deleteAuthor = async (authorid) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('authors');
        const delete_ = await pool.request()
                            .input('authorid', sql.Char(10), authorid)
                            .query(sqlQueries.deleteauthor);
        return delete_.recordset;
    } catch (error) {
        return error.message;
    }
}
module.exports = {
    getAllAuthors, getAuthorById, getAuthorsByLikeName, createAuthor, updateAuthor, deleteAuthor
}
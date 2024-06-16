const response = require('express')
const jwt = require('jsonwebtoken');
const controller = {}

const unggahProposal = async (req, res) => {
    res.render('mahasiswa/unggahProposal')
}
controller.unggahProposal = unggahProposal;

const unggahBalasan = async (req, res) => {
    res.render('mahasiswa/unggahBalasan')
}
controller.unggahBalasan = unggahBalasan;

const updateProposal = async (req, res) => {
    res.render('mahasiswa/updateProposal')
}
controller.updateProposal = updateProposal;

const updateBalasan = async (req, res) => {
    res.render('mahasiswa/updateBalasan')
}
controller.updateBalasan = updateBalasan;

const suratBalasan = async (req, res) => {
    res.render('sekjur/suratBalasan')
}
controller.suratBalasan = suratBalasan;

const displayFiles = async (req, res) => {
    res.render('sekjur/displayFile')
}
controller.displayFiles = displayFiles;


module.exports = controller
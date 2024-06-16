const dataUser = require('./user')
const login = require('./login')
const proposalMhs = require('./mahasiswa/proposal')
const view = require('./view/views')
const server = {}

server.dataUser = dataUser
server.login = login
server.proposalMhs = proposalMhs 
server.view = view

module.exports = server
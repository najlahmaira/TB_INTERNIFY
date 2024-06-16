const express = require('express')
const router =express.Router()
const middleware =require('../../middleware/authentication')
const controllers = require('../../controllers/sekretaris/balasan')

router.get('/dataSuratBalasan', middleware.verifyTokenSekre, controllers.getListBalasan)

module.exports = router
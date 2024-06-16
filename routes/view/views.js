const express = require('express')
const router = express.Router()
const controller = require('../../controllers/view/views')
const middleware = require('../../middleware/authentication')

router.get('/viewUnggahProposal', controller.unggahProposal)
router.get('/unggahBalasanView', controller.unggahBalasan)
router.get('/updateProposalView', controller.updateProposal)
router.get('/updateBalasanView', controller.updateBalasan)
router.get('/fileView', controller.displayFiles)
router.get('/suratBalasanView', controller.suratBalasan)

module.exports = router
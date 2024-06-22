const express = require('express')
const router =express.Router()
const middleware =require('../../middleware/authentication')
const controllers = require('../../controllers/sekretaris/suratTugas&Pengantar')
const controllers1 = require('../../controllers/sekretaris/mahasiswa')

router.get('/actionSuratTugas', middleware.verifyTokenSekre,controllers.actionSuratTugas)
router.post('/actionSuratTugas/:id', middleware.verifyTokenSekre,controllers.hapusTugas)
router.get('/actionSuratPermohonan', middleware.verifyTokenSekre, controllers.actionSuratPermohonan)
router.post('/actionSuratPermohonan/:id', middleware.verifyTokenSekre, controllers.hapusPengantar)
router.post('/actionSuratPermohonan/update/:id', middleware.verifyTokenSekre, controllers.updateStatusTolakPengantar)
router.get('/mahasiswa', middleware.verifyTokenSekre, controllers1.getDataMahasiswa)
router.get('/listTugas', middleware.verifyTokenSekre, controllers.getListTugas)
router.post('/postDosen/:id', middleware.verifyTokenSekre, controllers1.PostDosen)
router.post('/save-pdf', middleware.verifyTokenSekre, controllers.savePDF);
router.post('/create-tugas', middleware.verifyTokenSekre, controllers.createTugas);
router.post('/create-pengantar', middleware.verifyTokenSekre, controllers.createPengantar);

module.exports = router
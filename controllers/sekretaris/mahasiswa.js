const modelKelompok = require('../../models/kelompok')
const modelAnggota = require('../../models/anggota')
const modelMahasiswa = require('../../models/mahasiswa')
const dosen = require('../../models/dosen')
const { Op } = require('sequelize')

//data surat balasan
const getDataMahasiswa = async (req, res) => {
    try {
        const find = await modelKelompok.findAll({
            include: [{
                model: modelAnggota,
                as: 'dataAnggota',
                include: {

                    model: modelMahasiswa,
                    as: 'nama', // Alias yang sesuai dengan yang didefinisikan dalam relasi
                    attributes: ['nama']
                },
                attributes: ['id_anggota', 'nim_anggota']
            },
            {
                model: modelMahasiswa,
                as: 'namaKetua', // Alias yang sesuai dengan yang didefinisikan dalam relasi
                attributes: ['nama']
            },
            {
                model: dosen,
                as: 'namaDosen',
                attributes: ['nama']
            }
            ]
        })

        if (find.length <= 0) {
            return res.status(400).json({ success: false, message: 'Data belum tersedia' })
        }

        return res.status(200).json({ success: true, message: 'Data tersedia', data: find })
    } catch (error) {
        console.log(error)
        return res.status(500).json({ success: false, message: 'Kesalahan Server' })
    }
}
const PostDosen = async (req, res) => {
    try {
        const { nip } = req.body
        await modelKelompok.update({
            nip_dosen: nip
        }, {
            where: {
                id_kelompok: req.params.id
            }
        })
        return res.redirect('/dataMahasiswa');
    } catch (error) {
        console.log(error)
        return res.status(500).json({ success: false, message: 'Kesalahan Server' })
    }
}



module.exports = { getDataMahasiswa, PostDosen }
const response = require('express')
const jwt = require('jsonwebtoken');
const modelKelompok = require('../../models/kelompok')
const modelAnggota = require('../../models/anggota')
const modelTugas = require('../../models/surat_tugas')
const modelPengantar = require('../../models/surat_pengantar')
const modelMahasiswa = require('../../models/mahasiswa')
const dosen = require('../../models/dosen')
const modelPengajuanKp = require('../../models/pengajuan_kp')
const { Op } = require('sequelize')
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

const login = async (req, res) => {
    res.render('mahasiswa/login')
}
controller.login = login;

const loginSekjur = async (req, res) => {
    res.render('sekjur/login')
}
controller.loginSekjur = loginSekjur;

const dataMahasiswa = async (req, res) => {
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

        // if (find.length <= 0) {
        //     return res.status(400).json({ success: false, message: 'Data belum tersedia' })
        // }

        const transformedData = find.map(kelompok => {
            const transformedAnggota = [];

            // Tambahkan dosen ke dalam anggota
            if (kelompok.namaDosen) {
                transformedAnggota.push({
                    id_anggota: "",
                    nim_anggota: kelompok.nip_dosen,
                    nama: kelompok.namaDosen,
                    status: 'Dosen'
                });
            }

            // Tambahkan ketua ke dalam anggota
            if (kelompok.namaKetua) {
                transformedAnggota.push({
                    id_anggota: "",
                    nim_anggota: kelompok.nim_ketua,
                    nama: kelompok.namaKetua,
                    status: 'Ketua'
                });
            }

            // Tambahkan anggota kelompok
            kelompok.dataAnggota.forEach(anggota => {
                transformedAnggota.push({
                    id_anggota: anggota.id_anggota,
                    nim_anggota: anggota.nim_anggota,
                    nama: anggota.nama,
                    status: 'Anggota'
                });
            });

            // Return objek kelompok dengan data anggota yang telah diubah
            return {
                id_kelompok: kelompok.id_kelompok,
                nim_ketua: kelompok.nim_ketua,
                nip_dosen: kelompok.nip_dosen,
                created_at: kelompok.created_at,
                updated_at: kelompok.updated_at,
                dataAnggota: transformedAnggota
            };
        });

        return res.render('sekjur/dataMahasiswa', { data: transformedData });
        //return res.status(200).json({ success: true, message: 'Data tersedia', data: find })
    } catch (error) {
        console.log(error)
        return res.status(500).json({ success: false, message: 'Kesalahan Server' })
    }

    //console.log(find)

    // res.render('sekjur/dataMahasiswa', find)
}
controller.dataMahasiswa = dataMahasiswa;

const suratTugas = async (req, res) => {
    try {
        const findPengajuan = await modelPengajuanKp.findAll({
            where: {
                id_suratTugas: {
                    [Op.ne]: null
                }
            },
            include: [
                {
                    model: modelTugas,
                    as: 'dataPengajuanTugas',

                }
            ],
        })

        // if (findPengajuan.length <= 0) {
        //     return res.status(400).json({ success: false, message: 'Data belum tersedia' })
        // }

        res.render('sekjur/suratTugas', {data:findPengajuan})
    } catch (error) {
        console.log(error)
        return res.status(500).json({ success: false, message: 'Kesalahan Server' })
    }

}
controller.suratTugas = suratTugas;


const suratTugasView = async (req, res) => {
    try {
        const findPengajuan = await modelTugas.findOne({
            where: {
                id_surat_tugas: {
                    [Op.eq]: req.params.id
                }
            }
            
        })

    

        res.render('sekjur/suratTugasView', { id_tugas: req.params.id, tugas: findPengajuan })
    } catch (error) {
        console.log(error)
        return res.status(500).json({ success: false, message: 'Kesalahan Server' })
    }

}
controller.suratTugasView = suratTugasView;

const suratPengantar = async (req, res) => {
    try {
        const findPengajuan = await modelPengajuanKp.findAll({
            where: {
                id_suratPengantar: {
                    [Op.ne]: null
                }
            },
            include: [
                {
                    model: modelPengantar,
                    as: 'dataPengajuanPengantar',

                }
            ],
        })

        // if (findPengajuan.length <= 0) {
        //     return res.status(400).json({ success: false, message: 'Data belum tersedia' })
        // }

        //return res.status(200).json({ success: false, message: 'Kesalahan Server', data:findPengajuan })
        res.render('sekjur/suratPengantar', { data: findPengajuan })
    } catch (error) {
        console.log(error)
        return res.status(500).json({ success: false, message: 'Kesalahan Server' })
    }

}
controller.suratPengantar = suratPengantar;


const suratPengantarView = async (req, res) => {
    try {
        const findPengajuan = await modelPengantar.findOne({
            where: {
                id_suratPengantar: {
                    [Op.eq]: req.params.id
                }
            }

        })



        res.render('sekjur/suratPengantarView', { id_pengantar: req.params.id, tugas: findPengajuan })
    } catch (error) {
        console.log(error)
        return res.status(500).json({ success: false, message: 'Kesalahan Server' })
    }

}
controller.suratPengantarView = suratPengantarView;


const tambahDosen = async (req, res) => {
    const find = await dosen.findAll({
    })
    res.render('sekjur/tambahDosen', { id_kelompok: req.params.id, dataSelect: find })
}
controller.tambahDosen = tambahDosen;

const pengajuanSuratTugas = async (req, res) => {
    const find = await dosen.findAll({
    })
    const find1 = await modelTugas.findAll({
    })
    res.render('sekjur/pengajuanSuratTugas', { id_kelompok: req.params.id, dataSelect: find, count: find1?.length || 0 })
}
controller.pengajuanSuratTugas = pengajuanSuratTugas;

const pengajuanSuratPengantar = async (req, res) => {
    const find = await dosen.findAll({
    })
    const find1 = await modelPengantar.findAll({
    })
    res.render('sekjur/pengajuanSuratPengantar', { id_kelompok: req.params.id, dataSelect: find, count:find1?.length||0 })
}
controller.pengajuanSuratPengantar = pengajuanSuratPengantar;



module.exports = controller
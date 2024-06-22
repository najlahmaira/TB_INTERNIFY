const modelTugas = require('../../models/surat_tugas')
const modelPengantar = require('../../models/surat_pengantar')
const modelKelompok = require('../../models/kelompok')
const modelAnggota = require('../../models/anggota')
const modelPengajuanKp = require('../../models/pengajuan_kp')
const modelMahasiswa = require('../../models/mahasiswa')
const dosen = require('../../models/dosen')
const bcrypt = require('bcrypt')
const fs = require('fs');
var path = require('path');
const { Op } = require('sequelize')

//data surat balasan
const getListTugas = async (req, res) => {
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

        if (findPengajuan.length <= 0) {
            return res.status(400).json({ success: false, message: 'Data surat balasan belum tersedia' })
        }

        return res.status(200).json({ success: true, message: 'Data surat tersedia', data: findPengajuan })
    } catch (error) {
        console.log(error)
        return res.status(500).json({ success: false, message: 'Kesalahan Server' })
    }
}

const actionSuratTugas = async (req, res) => {
    try {
        const findTugas = await modelTugas.findOne({ where: { id_surat_tugas: req.query.id_tugas } })
        const find = await modelKelompok.findAll({
            where: { id_kelompok: req.query.id_kelompok },
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
        // return res.status(200).json({ success: false, data: findTugas, dataRow: transformedData, dataKelompok: find })
        res.render('sekjur/actionSuratTugas', { data: findTugas, dataRow: transformedData, dataKelompok: find })
    } catch (error) {
        console.log(error)
        return res.status(500).json({ success: false, message: error })
    }
}
const actionSuratPermohonan = async (req, res) => {
    const findTugas = await modelPengantar.findOne({ where: { id_suratPengantar: req.query.id_pengantar } })
    const find = await modelKelompok.findAll({
        where: { id_kelompok: req.query.id_kelompok },
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
    // return res.status(200).json({ success: false, data: findTugas, dataRow: transformedData, dataKelompok: find })
    res.render('sekjur/actionSuratPermohonan', { data: findTugas, dataRow: transformedData, dataKelompok: find })
    //res.render('sekjur/actionSuratPermohonan')
}

const hapusTugas = async (req, res) => {
    try {

        await modelTugas.destroy({
            where: { id_surat_tugas: req.params.id }
        })

        return res.redirect('/suratTugas');
    } catch (error) {
        console.log(error)
        return res.status(500).json({ success: false, message: 'Kesalahan Server' })
    }
}


const hapusPengantar = async (req, res) => {
    try {

        await modelPengantar.destroy({
            where: { id_suratPengantar: req.params.id }
        })

        return res.redirect('/suratPengantar');
    } catch (error) {
        console.log(error)
        return res.status(500).json({ success: false, message: 'Kesalahan Server' })
    }
}

const updateStatusTolakPengantar = async (req, res) => {
    try {
        await modelPengantar.update({
            status: "ditolak"
        }, {
            where: {
                id_suratPengantar: req.params.id
            }
        })
        return res.redirect('/suratPengantar');
    } catch (error) {
        console.log(error)
        return res.status(500).json({ success: false, message: 'Kesalahan Server' })
    }
}


const savePDF = async (req, res) => {
    const pdfBuffer = req.body; // Ambil data PDF dari body request

    try {
        const filePath = path.join(__dirname, '..', '..', 'public', 'doc', 'surat', req.query.id + '.' + req.query.name); // Path tempat menyimpan file PDF
        fs.writeFileSync(filePath, pdfBuffer); // Menyimpan file PDF ke disk
        if (req.query.name == 'surat_tugas.pdf') {
            await modelTugas.update({
                file_surat_tugas: req.query.id + '.' + req.query.name,
            }, {
                where: {
                    id_surat_tugas: req.query.id
                }
            })
        } else {
            await modelPengantar.update({
                file_suratPengantar: req.query.id + '.' + req.query.name,
            }, {
                where: {
                    id_suratPengantar: req.query.id
                }
            })
        }


        console.log('File saved successfully:', filePath);
        res.status(200).send('File saved successfully');
    } catch (error) {
        console.error('Error saving file:', error);
        res.status(500).send('Error saving file');
    }
}

const createTugas = async (req, res) => {
    const { no, perusahaan_tujuan, tanggal_mulai, tanggal_selesai, nip_dosen, nim_ketua, nim, nama } = req.body;

    try {
        // Membuat tugas baru
        const tambahTugas = await modelTugas.create({
            no: no,
            perusahaan_tujuan: perusahaan_tujuan,
            tanggal_mulai: tanggal_mulai,
            tanggal_selesai: tanggal_selesai,
            status: 'diproses'
        });

        // Membuat kelompok baru
        const tambahKelompok = await modelKelompok.create({
            nim_ketua: nim_ketua,
            nip_dosen: nip_dosen
        });

        // Membuat pengajuan KP baru
        await modelPengajuanKp.create({
            nip: req.sekretaris.nip,
            id_kelompok: tambahKelompok.id_kelompok,
            id_suratTugas: tambahTugas.id_surat_tugas,
            status_pengajuan: 'Diproses'
        });

        // Menambahkan anggota ke kelompok
        if (nim.length > 0) {
            for (let i = 0; i < nim.length; i++) {
                const nimValue = nim[i];
                const namaValue = nama[i];

                // Membuat mahasiswa baru
                await modelMahasiswa.create({
                    nim_ketua: nimValue,
                    nama: namaValue,
                    password: await bcrypt.hash('12345678', 10)
                });

                // Menambahkan mahasiswa ke kelompok
                await modelAnggota.create({
                    nim_anggota: nimValue,
                    id_kelompok: tambahKelompok.id_kelompok
                });
            }
        }

        // Mengembalikan response dengan redirect ke halaman actionSuratTugas
        return res.redirect(`/actionSuratTugas?id_tugas=${tambahTugas.id_surat_tugas}&id_kelompok=${tambahKelompok.id_kelompok}`);
    } catch (error) {
        console.error(error);
        return res.status(500).send('Terjadi kesalahan pada server.');
    }
};

const createPengantar = async (req, res) => {
    const { no, perusahaan_tujuan, tanggal_mulai, tanggal_selesai, nip_dosen, nim_ketua, nim, nama } = req.body;

    try {
        // Membuat tugas baru
        const tambahTugas = await modelPengantar.create({
            no: no,
            perusahaan_tujuan: perusahaan_tujuan,
            tanggal_mulai: tanggal_mulai,
            tanggal_selesai: tanggal_selesai,
            status: 'diproses'
        });

        // Membuat kelompok baru
        const tambahKelompok = await modelKelompok.create({
            nim_ketua: nim_ketua,
            nip_dosen: nip_dosen
        });

        // Membuat pengajuan KP baru
        await modelPengajuanKp.create({
            nip: req.sekretaris.nip,
            id_kelompok: tambahKelompok.id_kelompok,
            id_suratPengantar: tambahTugas.id_suratPengantar,
            status_pengajuan: 'Diproses'
        });

        // Menambahkan anggota ke kelompok
        if (nim.length > 0) {
            for (let i = 0; i < nim.length; i++) {
                const nimValue = nim[i];
                const namaValue = nama[i];

                // Membuat mahasiswa baru
                await modelMahasiswa.create({
                    nim_ketua: nimValue,
                    nama: namaValue,
                    password: await bcrypt.hash('12345678', 10)
                });

                // Menambahkan mahasiswa ke kelompok
                await modelAnggota.create({
                    nim_anggota: nimValue,
                    id_kelompok: tambahKelompok.id_kelompok
                });
            }
        }

        // Mengembalikan response dengan redirect ke halaman actionSuratTugas
        return res.redirect(`/actionSuratPermohonan?id_pengantar=${tambahTugas.id_suratPengantar}&id_kelompok=${tambahKelompok.id_kelompok}`);
    } catch (error) {
        console.error(error);
        return res.status(500).send('Terjadi kesalahan pada server.');
    }
};


module.exports = { getListTugas, actionSuratPermohonan, actionSuratTugas, hapusTugas, hapusPengantar, updateStatusTolakPengantar, savePDF, createTugas, createPengantar}
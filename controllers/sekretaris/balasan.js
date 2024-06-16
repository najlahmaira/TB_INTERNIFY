const modelBalasan = require('../../models/surat_balasan')
const modelKelompok = require('../../models/kelompok')
const modelPengajuanKp = require('../../models/pengajuan_kp')
const {Op} = require('sequelize')

//data surat balasan
const getListBalasan = async (req,res) => {
    try {
        const findPengajuan = await modelPengajuanKp.findAll({
            where:{
                id_suratBalasan:{
                    [Op.ne]: null
                }
            },
            include: [
                {
                    model: modelKelompok,
                    as: 'dataKelompokPengajuan',
                    attributes: ['id_kelompok']
                },
                {
                    model: modelBalasan,
                    as: 'dataPengajuanBalasan',
                    attributes: ['tanggal_pengajuan', 'perusahaan_tujuan', 'status', 'file_surat_balasan']

                }
            ],
            attributes: ['id_pengajuan']
        })

        if (findPengajuan.length <= 0) {
            return res.status(400).json({success: false, message: 'Data surat balasan belum tersedia'})
        }

        return res.status(200).json({success:true, message: 'Data surat tersedia', data: findPengajuan})
    } catch (error) {
        console.log(error)
        return res.status(500).json({success: false, message: 'Kesalahan Server'})
    }
}


module.exports = {getListBalasan}
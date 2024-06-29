const { DataTypes } = require('sequelize')
const sequelize = require('../config/db')
const anggota = require('./anggota')
const mahasiswa = require('./mahasiswa');
const dosen = require('./dosen');
const pengajuan_kp = require('./pengajuan_kp')

const kelompok = sequelize.define('kelompok', {
    id_kelompok: {
        type: DataTypes.INTEGER(11),
        allowNull: false,
        autoIncrement: true,
        primaryKey: true
    },
    nim_ketua: {
        type: DataTypes.STRING(20),
        allowNull: false
    },
    nip_dosen: {
        type: DataTypes.STRING(20),
        allowNull: false
    },
    created_at: {
        type: DataTypes.DATE,
        allowNull: false
    },
    updated_at: {
        type: DataTypes.DATE,
        allowNull: false
    }

}, {
    tableName: 'kelompok',
    timestamps: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at'
})

kelompok.hasMany(anggota, { foreignKey: 'id_kelompok', as: 'dataAnggota' })
anggota.belongsTo(kelompok, { foreignKey: 'id_kelompok', as: 'dataKelompok' })

kelompok.hasOne(pengajuan_kp, { foreignKey: 'id_kelompok', as: 'dataPengajuanKlmpk' })
pengajuan_kp.belongsTo(kelompok, { foreignKey: 'id_kelompok', as: 'dataKelompokPengajuan' })
kelompok.belongsTo(dosen, { foreignKey: 'nip_dosen', as: 'namaDosen' });

//kelompok.belongsTo(mahasiswa, { foreignKey: 'nim_ketua', as: 'ketua' });
//kelompok.belongsTo(dosen, { foreignKey: 'nip_dosen', as: 'dosen', targetKey: 'nip' });



module.exports = kelompok
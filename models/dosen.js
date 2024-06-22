const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const kelompok = require('./kelompok');


const dosen = sequelize.define('dosen', {
    nip: {
        type: DataTypes.STRING(20),
        primaryKey: true
    },
    nama: {
        type: DataTypes.STRING(100),
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
    tableName: 'dosen',
    timestamps: false,
    createdAt: 'created_at',
    updatedAt: 'updated_at'
});



module.exports = dosen

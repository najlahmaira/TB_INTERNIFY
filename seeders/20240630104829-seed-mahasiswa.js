'use strict';

const bcrypt = require('bcrypt');

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const hashedPassword1 = await bcrypt.hash('citra123', 10);

    try {
      await queryInterface.bulkInsert('mahasiswa', [
        {
          nim_ketua: '2111523016',
          nama: 'Aulia',
          password: hashedPassword1,
          created_at: new Date(),
          updated_at: new Date()
        },
      ], {});
    } catch (error) {
      console.error('Error seeding mahasiswa:', error);
    }
  },

  down: async (queryInterface, Sequelize) => {
    try {
      await queryInterface.bulkDelete('mahasiswa', null, {});
    } catch (error) {
      console.error('Error deleting mahasiswa:', error);
    }
  }
};

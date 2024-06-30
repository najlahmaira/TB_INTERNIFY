'use strict';

const bcrypt = require('bcrypt');

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const hashedPassword1 = await bcrypt.hash('sekretaris', 10);

    try {
      await queryInterface.bulkInsert('sekretaris', [
        {
          nip: '1234567890',
          nama: 'Nindy',
          password: hashedPassword1,
          created_at: new Date(),
          updated_at: new Date()
        },
      ], {});
    } catch (error) {
      console.error('Error seeding sekretaris:', error);
    }
  },

  down: async (queryInterface, Sequelize) => {
    try {
      await queryInterface.bulkDelete('sekretaris', null, {});
    } catch (error) {
      console.error('Error deleting sektretaris:', error);
    }
  }
};

const {DataTypes} = require  ('sequelize')
const {connSequelize} = require('../config/bdConnection')
const {_padraoTableBDExistente} = require('../config/configTabelasBD')

const Carga = connSequelize.define('carga', {
    cd_carga: {
      type: DataTypes.INTEGER,
      primaryKey: true
    },
    sg_carga: {
      type: DataTypes.STRING(45)
    },
    ds_carga: {
      type: DataTypes.STRING(45)
    },
    dt_carga_entrada: {
      type: DataTypes.DATE
    },
    dt_carga_saida: {
      type: DataTypes.DATE
    }
  });
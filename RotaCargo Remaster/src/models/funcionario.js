const {DataTypes} = require('sequelize')
const {connSequelize} = require('../config/bdConnection')
const {_padraoTableBDExistente} = require('../config/configTabelasBD')
const truk_infomocion = require('../controller/truk_infomocion')

const Funcionario = connSequelize.define('funcionario', {
    cd_funcionario: {
      type: DataTypes.INTEGER,
      primaryKey: true
    },
    nm_funcionario: {
      type: DataTypes.STRING(30)
    }
  },
    _padraoTableBDExistente('truk_infomocion')
)

module.exports = {
    Funcionario
}
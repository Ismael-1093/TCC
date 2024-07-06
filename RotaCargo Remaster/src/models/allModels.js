const { connSequelize } = require('../config/bdConnection')
const { _padraoTableBDExistente } = require('../../config/configTabelasBD')
const { connSequelize } = require('../config/bdConnection');
const { DataTypes } = require('sequelize');
const {Trukinfo} = require('../models/truk_infomocion')

// Definição dos modelos das tabelas
const Fornecedor = connSequelize.define('fornecedor', {
  cd_fornecedor: {
    type: DataTypes.INTEGER,
    primaryKey: true
  },
  nm_fornecedor: {
    type: DataTypes.STRING(30)
  },
  cd_cnpj: {
    type: DataTypes.STRING(14)
  }
});

const Funcionario = connSequelize.define('funcionario', {
  cd_funcionario: {
    type: DataTypes.INTEGER,
    primaryKey: true
  },
  nm_funcionario: {
    type: DataTypes.STRING(30)
  }
});

const Cliente = connSequelize.define('cliente', {
  cd_cliente: {
    type: DataTypes.INTEGER,
    primaryKey: true
  },
  nm_cliente: {
    type: DataTypes.STRING(30)
  },
  ds_cliente: {
    type: DataTypes.STRING(40)
  }
});

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

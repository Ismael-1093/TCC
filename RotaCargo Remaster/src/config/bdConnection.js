const { Sequelize } = require('sequelize')

const usuario = 'root'
const senha = 'root'
const nmBD = 'caminhão'
const connSequelize = new Sequelize(
    `mysql://${usuario}:${senha}@localhost:3306/${nmBD}`
)

module.exports = {
    nmBD,
    connSequelize
}


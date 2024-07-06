const { Trukinfo } = require('../models/dono')
const { Trunk_info_Carga } = require('../models/informacoesContato')

module.exports = {
    findAllDonos: async () => {
        return await Trukinfo.findAll({ raw: true })
    },
    queryEspecial1: async () => {
        return await Trukinfo.findAll({
            include: {
                model: Trunk_info_Carga,
                required: true
            },
            raw: true
        })
    }
}
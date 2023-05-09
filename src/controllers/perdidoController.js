import perdidoModel from '../models/perdidoModel.js'


//listar
export const listAllPerdido = (req, res) => {
   perdidoModel.listAllPerdido((error, result) => {
        if (error)
            res.status(500).json({ message: "Erro no Banco de Dados" })
        if (result) {
            if (result.length) {
                res.json(result)
            } else {
                res.json({ message: "Nenhum animal perdido cadastrado!" })
            }
        }
    })
}



//criar adocao
export const createPerdido = (req, res) => {

    const perdido = req.body

    perdidoModel.createPerdido(perdido, (error, result) => {
        if (error)
            res.status(500).json({ message: "Erro no Banco de Dados" })
        if (result) {
            res.json({
                message: "Animal Cadastrado!",
                perdido: { id: result.insertId, ...perdido }
            })
        }
    })
}

//deletar
export const deletePerdido = (req, res) => {
    const { id } = req.body
    perdidoModel.deletePerdido(id, (error, result) => {
        if (error)
            res.status(500).json({ message: "Erro no Banco de Dados" })
        if (result) {
            if (result.affectedRows) {
                res.json({ message: "Animal deletado com Sucesso!" })
            } else {
                res.status(404).json({ message: `Animal ${id} não encontrado` })
            }
        }
    })
}

//editar
export const updatePerdido = (req, res) => {

    const perdido = req.body

    perdidoModel.updatePerdido(perdido, (error, result) => {
        if (error)
            res.status(500).json({ message: "Erro no Banco de Dados" })
        if (result)
            res.json({ message: "Cadastro atualizado!" })
    })
}


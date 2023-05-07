import adocaoModel from '../models/adocaoModel.js'


//listar
export const listAllAdocao = (req, res) => {
   adocaoModel.listAllAdocao((error, result) => {
        if (error)
            res.status(500).json({ message: "Erro no Banco de Dados" })
        if (result) {
            if (result.length) {
                res.json(result)
            } else {
                res.json({ message: "Nenhuma adoção cadastrada!" })
            }
        }
    })
}


//selecionar pelo id 


//criar adocao
export const createAdocao = (req, res) => {

    const adocao = req.body

    adocaoModel.createAdocao(adocao, (error, result) => {
        if (error)
            res.status(500).json({ message: "Erro no Banco de Dados" })
        if (result) {
            res.json({
                message: "Adoção Cadastrada!",
                adocao: { id: result.insertId, ...adocao }
            })
        }
    })
}

//deletar
export const deleteAdocao = (req, res) => {
    const { id } = req.body
    adocaoModel.deleteAdocao(id, (error, result) => {
        if (error)
            res.status(500).json({ message: "Erro no Banco de Dados" })
        if (result) {
            if (result.affectedRows) {
                res.json({ message: "Adoção deletada com Sucesso!" })
            } else {
                res.status(404).json({ message: `Adoção ${id} não encontrado` })
            }
        }
    })
}

//editar
export const updateAdocao = (req, res) => {

    const adocao = req.body

    adocaoModel.updateAdocao(adocao, (error, result) => {
        if (error)
            res.status(500).json({ message: "Erro no Banco de Dados" })
        if (result)
            res.json({ message: "Adoção atualizada!" })
    })
}


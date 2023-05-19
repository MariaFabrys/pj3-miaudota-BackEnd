import userModel from '../models/userModel.js'
import zodErrorFormat from '../helper/zodErrorFormat.js'

export const listAllUsers = (req, res) => {
    userModel.listAllUsers((error, result) => {
        if (error)
            res.status(500).json({ message: "Erro no Banco de Dados" })
        if (result) {
            if (result.length) {
                res.json(result)
            } else {
                res.json({ message: "Nenhum usuário cadastrado!" })
            }
        }
    })
}

export const createUser = (req, res) => {

    const user = req.body
    const validUser = userModel.validateUserToCreate(user)
    if (validUser?.error) {
        res.status(400).json({
            message: 'Dados inválidos',
            fields: zodErrorFormat(validUser.error)
        })
        return
    }
    const userValidated = validUser.data
    userModel.createUser(userValidated, (error, result) => {
        if (error)
            res.status(500).json({ message: "Erro no Banco de Dados" })
        if (result) {
            res.json({
                message: "Usuário Cadastrado!",
                user: {
                    id: result.insertId,
                    ...user
                }
            })
        }
    })



}

export const deleteUser = (req, res) => {
    const { id } = req.body
    const idUserLogged = req.idUserLogged
    const rolesUserLogged = req.rolesUserLogged

    if (!id || isNaN(id)) {
        res.status(400).json({
            message: 'Dados inválidos',
            fields: {
                id: { messages: ['ID deve ser um número inteiro.'] }
            }
        })
        return
    }

    // verifica se o usuário é um admin ou se o id do user da sessão é igual 
    if (!rolesUserLogged.includes('admin')) {
        if (idUserLogged !== id) {
            res.status(401).json({ message: `Usuário não autorizado!` })
            return
        }
    }

    userModel.deleteUser(id, (error, result) => {
        if (error)
            res.status(500).json({ message: "Erro no Banco de Dados" })
        if (result) {
            if (result.affectedRows) {
                res.json({ message: "Usuário Deletado com Sucesso!" })
            } else {
                res.status(404).json({ message: `Usuário ${id} não encontrado` })
            }
        }
    })
}


export const updateUser = (req, res) => {
    const user = req.body
    const validUser = userModel.validateUserToUpdate(user)

    const idUserLogged = req.idUserLogged
    const rolesUserLogged = req.rolesUserLogged

    if (validUser?.error) {
        res.status(400).json({
            message: 'Dados inválidos',
            fields: zodErrorFormat(validUser.error)
        })
        return
    }
    const userValidated = validUser.data

      // verifica se o usuário é um admin ou se o id do user da sessão é igual
      if (!rolesUserLogged.includes('admin')) {
        if (idUserLogged !== user.id) {
            res.status(401).json({ message: `Usuário não autorizado!` })
            return
        }
    }
    //TODO Verificar se os dados são válidos

    userModel.updateUser(userValidated, (error, result) => {
        if (error)
            res.status(500).json({ message: "Erro no Banco de Dados" })
        if (result) {
            if (result.affectedRows) {
                res.json({ message: "Usuário Atualizado com Sucesso!" })
            } else {
                res.status(404).json({ message: `Usuário ${user.id} não encontrado` })
            }
        }
    })
}
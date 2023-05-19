import userModel from '../models/userModel.js'
import sessionModel from '../models/sessionModel.js'
import crypto from 'crypto'


export const login = (req, res) => {
    const { email, senha } = req.body

    userModel.loginUser(email, senha, (error, resultUser) => {
        if (error)
            res.status(500).json({ message: "Erro no Banco de Dados" })
        if (resultUser) {
            if (resultUser.length) { //checa se achou um user
                // se achou cria a session
                const token = crypto.randomUUID()
                const idUser = resultUser[0].id
                sessionModel.createSession(idUser, token, (error, resultSession) => {
                    if (error)
                        res.status(500).json({ message: "Erro no Banco de Dados" })
                    if (resultSession) {
                        res.json({
                            message: "Usuário Logado!",
                            token: token,
                            user: {
                                nome: resultUser[0].nome,
                                fotoperfil: resultUser[0].fotoperfil,
                                fotocapa: resultUser[0].fotocapa,
                                usuario: resultUser[0].usuario,
                                qtdanimais: resultUser[0].qtdanimais,
                                roles: resultUser[0].roles
                            }
                        })
                    }
                })
            } else {
                res.status(401).json({ message: "Login ou senha inválidos. Acesso não autorizado!" })
            }
        }
    })
}

export const logout = (req, res) => {
    const { email, token } = req.body

    sessionModel.deleteSession(email, token, (error, result) => {
        if (error)
            res.status(500).json({ message: "Erro no Banco de Dados" })
        if (result) {
            if (result.affectedRows) {
                res.json({ message: "Usuário deslogado com sucesso!" })
            } else {
                res.status(404).json({ message: `Session não encontrada` })
            }
        }
    })
}
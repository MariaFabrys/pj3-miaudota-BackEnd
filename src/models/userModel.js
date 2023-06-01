import con from '../db/dbConnection.js'
import { z } from 'zod'

import sha256 from '../helper/sha256.js'


const userSchema = z.object({
    id:
        z.number({
            required_error: "ID é obrigatório.",
            invalid_type_error: "ID deve ser um número.",
        }),
    nome:
        z.string({
            required_error: "Nome é obrigatória.",
            invalid_type_error: "Nome deve ser uma string.",
        })
            .min(3, { message: "Nome deve ter no mínimo 3 caracteres." })
            .max(100, { message: "Nome deve ter no máximo 100 caracteres." }),
    email:
        z.string({
            required_error: "Email é obrigatória.",
            invalid_type_error: "Email deve ser uma string.",
        })
            .min(5, { message: "O email deve ter ao menos 5 caracteres." })
            .max(200, { message: "Email deve ter no máximo 200 caracteres." }),
    senha:
        z.string({
            required_error: "Senha é obrigatória.",
            invalid_type_error: "Senha deve ser uma string.",
        })
            .min(6, { message: "Senha deve ter no mínimo 6 caracteres." })
            .max(256, { message: "Senha deve ter no máximo 256 caracteres." }),
    fotoperfil:
        z.string({
            invalid_type_error: "Foto de perfil deve ser uma string.",
        })
            .optional(),
    

    usuario:
        z.string({
            required_error: "usuario é obrigatória.",
            invalid_type_error: "usuario deve ser uma string.",
        })
            .min(5, { message: "O Usuário deve ter ao menos 5 caracteres." })
            .max(200, { message: "Usuário deve ter no máximo 200 caracteres." }),
    idade:
        z.string({
            required_error: "idade é obrigatória.",
            invalid_type_error: "idade deve ser um número.",
        })
            .optional(),
            
    qtdanimais:
        z.string({
            invalid_type_error: "Quantidade de animal  deve ser um número.",
        })
            .optional()


})

export const validateUserToCreate = (user) => {
    const partialUserSchema = userSchema.partial({ id: true });
    return partialUserSchema.safeParse(user)
}

export const validateUserToUpdate = (user) => {
    const partialUserSchema = userSchema.partial({ senha: true })
    return partialUserSchema.safeParse(user)
}


export const listAllUsers = (callback) => {
    const sql = "SELECT id, nome, email,  fotoperfil, fotocapa, usuario, qtdanimais, roles FROM usuario;"
    con.query(sql, (err, result) => {
        if (err) {
            callback(err, null)
            console.log(`DB error: ${err.sqlMessage}`)
        } else {
            callback(null, result)
        }
    })
}

export const createUser = (user, callback) => {
    const { nome, usuario, email, senha } = user

    const sql = 'INSERT INTO usuario ( nome, usuario, email, senha) VALUES (?, ?, ?, ?);'
    const values = [nome, usuario, email, sha256(senha)]

    con.query(sql, values, (err, result) => {
        if (err) {
            callback(err, null)
            console.log(`DB Error: ${err.sqlMessage}`)
        } else {
            callback(null, result)
        }
    })
}

export const deleteUser = (id, callback) => {
    const sql = 'DELETE FROM usuario WHERE id =?; '
    const value = [id]

    con.query(sql, value, (err, result) => {
        if (err) {
            callback(err, null)
            console.log(`DB error: ${err.sqlMessage}`)

        } else {
            callback(null, result)
        }
    })
}

export const updateUser = (user, callback) => {
    const { id, fotoperfil, fotocapa, nome, usuario, email, senha, idade, qtdanimais } = user
    const sql = 'UPDATE usuario SET fotoperfil = ?, fotocapa = ?, nome = ?, usuario = ?, email = ?, senha = ?, idade = ?, qtdanimais = ?  WHERE id = ?;'
    const values = [fotoperfil, fotocapa, nome, usuario,  email, senha, idade,  qtdanimais, id ]  

    con.query(sql, values, (err, result) => {
        if (err) {
            callback(err, null)
            console.log(`DB error: ${err.sqlMessage}`)

        } else {
            callback(null, result)
        }
    })
}


export const loginUser = (email, senha, callback) => {
    const sql = 'SELECT * FROM usuario WHERE email = ? AND senha = ?;'
    const value = [email, sha256(senha)]
    con.query(sql, value, (err, result) => {
        if (err) {
            callback(err, null)
            console.log(`DB Error: ${err.sqlMessage}`)
        } else {
            callback(null, result)
        }
    })
}

export default { listAllUsers, createUser, deleteUser, updateUser, loginUser, validateUserToCreate, validateUserToUpdate }

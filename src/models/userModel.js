import con from '../db/dbConnection.js'

export const listAllUsers = (callback) => {
    const sql = "SELECT * FROM usuario;"
    con.query(sql, (err, result) => {
        if (err) {
            callback(err, null)
            console.log(`DB error: ${err.sqlMessage}`)
        } else {
            callback(null, result)
        }
    })
}

//forma mais rápida de inserir dados 
export const createUser = (user, callback) => {
    const { fotoperfil, fotocapa, nome, usuario, email, senha, idade, qtdanimais } = user
    const sql = 'INSERT INTO usuario SET ?;'
    const values = { fotoperfil, fotocapa, nome, usuario, email, senha, idade, qtdanimais }

    con.query(sql, values, (err, result) => {
        if (err) {
            callback(err, null)
            console.log(`DB error: ${err.sqlMessage}`)

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
    const { fotoperfil, fotocapa, nome, usuario, email, senha, idade, qtdanimais } = user
    const sql = 'UPDATE usuario SET ?;'
    const values = { fotoperfil, fotocapa, nome, usuario, email, senha, idade, qtdanimais }

    con.query(sql, values, (err, result) => {
        if (err) {
            callback(err, null)
            console.log(`DB error: ${err.sqlMessage}`)

        } else {
            callback(null, result)
        }
    })
}

export default { listAllUsers, createUser, deleteUser, updateUser }

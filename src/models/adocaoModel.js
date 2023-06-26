import con from '../db/dbConnection.js'

//listar
export const listAllAdocao = (callback) => {
    const sql = "SELECT nome, foto, idade, sexo, castrado, raca, descricao, tipo FROM adocao;"
    con.query(sql, (err, result) => {
        if (err) {
            callback(err, null)
            console.log(`DB error: ${err.sqlMessage}`)
        } else {
            callback(null, result)
        }
    })
}

//criar
export const createAdocao = (adocao, callback) => {
    const { nome, foto, idade, sexo, castrado, raca, descricao,  tipo } = adocao
    const sql = 'INSERT INTO adocao SET ?;'
    const values = {nome, foto, idade, sexo, castrado, raca, descricao, tipo}

    con.query(sql, values, (err, result) => {
        if (err) {
            callback(err, null)
            console.log(`DB error: ${err.sqlMessage}`)

        } else {
            callback(null, result)
        }
    })
}

export const deleteAdocao = (id, callback) => {
    const sql = 'DELETE FROM adocao WHERE id =?; '
    const value =[id]

    con.query(sql, value, (err, result) => {
        if (err) {
            callback(err, null)
            console.log(`DB error: ${err.sqlMessage}`)

        } else {
            callback(null, result)
        }
    })
}

export const updateAdocao = (adocao, callback) => {
    const {nome, foto, idade, sexo, castrado, raca, tipo} = adocao
    const sql = 'UPDATE adocao SET ?;'
    const values = {nome, foto, idade, sexo, castrado, raca, descricao, tipo}

    con.query(sql, values, (err, result) => {
        if (err) {
            callback(err, null)
            console.log(`DB error: ${err.sqlMessage}`)

        } else {
            callback(null, result)
        }
    })
}



export default { listAllAdocao, createAdocao, deleteAdocao, updateAdocao  }

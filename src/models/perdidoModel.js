import con from '../db/dbConnection.js'

//listar
export const listAllPerdido = (callback) => {
    const sql = "SELECT tipo, nome, idade, raca, sexo, porte, foto, bairro, descricao  FROM perdido;"
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
export const createPerdido = (perdido, callback) => {
    const {  tipo, nome, idade, raca, sexo, porte, foto, bairro, descricao} = perdido
    const sql = 'INSERT INTO perdido SET ?;'
    const values = { tipo, nome, idade, raca, sexo, porte, foto, bairro, descricao}

    con.query(sql, values, (err, result) => {
        if (err) {
            callback(err, null)
            console.log(`DB error: ${err.sqlMessage}`)

        } else {
            callback(null, result)
        }
    })
}

export const deletePerdido = (id, callback) => {
    const sql = 'DELETE FROM perdido WHERE id =?; '
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

export const updatePerdido = (perdido, callback) => {
    const { tipo, nome, idade, raca, sexo, porte, foto, bairro, descricao} = perdido
    const sql = 'UPDATE perdido SET ?;'
    const values = { tipo, nome, idade, raca, sexo, porte, foto, bairro, descricao}

    con.query(sql, values, (err, result) => {
        if (err) {
            callback(err, null)
            console.log(`DB error: ${err.sqlMessage}`)

        } else {
            callback(null, result)
        }
    })
}



export default { listAllPerdido, createPerdido, deletePerdido, updatePerdido  }

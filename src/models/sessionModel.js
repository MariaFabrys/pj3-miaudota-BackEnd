import con from '../db/dbConnection.js'

export const createSession = (userId, token, callback) => {
    const sql = 'INSERT INTO sessoes (id_usuario, sessao) VALUES (?, ?);'
    const values = [userId, token]
    con.query(sql, values, (err, result) => {
        if (err) {
            callback(err, null)
            console.log(`DB Error: ${err.sqlMessage}`)
        } else {
            callback(null, result)
        }
    })
}

export const checkSession = (token, callback) => {
    const sql = `
    SELECT s.id_usuario, u.roles
    FROM sessoes as s
    INNER JOIN usuarios as u
    ON s.id_usuario = u.id
    WHERE s.sessao = ?;
    `
    const values = [token]
    con.query(sql, values, (err, result) => {
        if (err) {
            callback(err, null)
            console.log(`DB Error: ${err.sqlMessage}`)
        } else {
            callback(null, result)
        }
    })
}

export const deleteSession = (email, token, callback) => {
    const sql = 'DELETE FROM sessoes WHERE id_usuario = (SELECT id FROM usuario WHERE email = ?) AND sessao = ?;'
    const value = [email, token]
    con.query(sql, value, (err, result) => {
        if (err) {
            callback(err, null)
            console.log(`DB Error: ${err.sqlMessage}`)
        } else {
            callback(null, result)
        }
    })
}

export default { createSession, deleteSession, checkSession }
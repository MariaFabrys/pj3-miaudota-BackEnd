//Server config
export const SERVER = {
    PORT: process.env.PORT || 3100
}
//Database config
export const DB = {
    HOST: process.emv.DB_HOST || "localhost",
    USER: process.emv.DB_USER || "root",
    PASS: process.emv.DB_PASSWORD || "",
    DB_NAME: process.emv.DB_NAME || "miaudota_db"
}
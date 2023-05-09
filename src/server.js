import  express  from 'express'
import { SERVER } from './config.js'
import cors from 'cors'
import adocaoRouter from './routes/adocaoRouter.js'
import userRouter from './routes/userRouter.js'
import perdidoRouter from './routes/perdidoRouter.js'

const app = express()
const port = SERVER.PORT

app.use(cors())
app.use(express.json())

app.use('/adocao', adocaoRouter)
app.use('/user', userRouter)
app.use('/perdido', perdidoRouter)

app.all('*', (req, res) => {
  res.status(404).json( {message:  '404 Rota não encontrada...'})
})


app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})







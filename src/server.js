//package
import  express  from 'express'
import cors from 'cors'
//routers
import adocaoRouter from './routes/adocaoRouter.js'
import userRouter from './routes/userRouter.js'
import authRoutes from './routes/authRouter.js'
import perdidoRouter from './routes/perdidoRouter.js'
//files
import { SERVER } from './config.js'
import errorHandler from './middlewares/errorHandler.js'



const app = express()
const port = SERVER.PORT

app.use(cors())
app.use(express.json())

app.use('/adocao', adocaoRouter)
app.use('/user', userRouter)
app.use('/perdido', perdidoRouter)

app.use('/auth/', authRoutes)


app.all('*', (req, res) => {
  res.status(404).json( {message:  '404 Rota não encontrada...'})
})

app.use(errorHandler)

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})







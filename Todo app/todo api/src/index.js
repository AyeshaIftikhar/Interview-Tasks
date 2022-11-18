import 'dotenv/config'
import Express from 'express'
import Cors from 'cors'
import Helmet from 'helmet'
import RateLimit from 'express-rate-limit'
import Morgan from 'morgan'
import Mongoose from 'mongoose'
import Todo from './routes/todo'

// rate limit
const limiter = RateLimit({
    windowMs: 15 * 60 * 1000,
    max: 100,
    standardHeaders: true,
    legacyHeaders: false,
})

// app
const app = Express()

// connect with mangodb
Mongoose.connect('mongodb://localhost/demotodo')
    .then(() => console.log('Connected to MongoDB...'))
    .catch((err) => console.log(`Could not connect to MongoDB...${err}`))

app.use(Cors())
app.use(Helmet())
app.use(limiter)
app.use(Express.json())
app.use(Morgan('tiny')) 
app.use('/api/v1', Todo) // route

// Port number (reading port from .env file)
const port = process.env.PORT || 3000
app.listen(port, () => console.log(`listening on port ${port}`))

import Express from 'express'
import dotenv from 'dotenv'
import cors from 'cors'

import ElementRoute from './routes/elementRoute.js'
import MoleculaRoute from './routes/moleculaRoute.js'
import search_route from './service/Search.js'

dotenv.config()
const PORT = process.env.PORT || 3000
const API_PREFIX = process.env.API_PREFIX || "/api"

const app = Express()

app.use( cors() )
app.use(Express.json())

app.use("/", Express.static("./dist"))

app.use(API_PREFIX+"/element", ElementRoute)
app.use(API_PREFIX+"/molecula", MoleculaRoute)
app.use(API_PREFIX+"/search/:term", search_route)

app.listen(PORT, () => {
	console.log(`Listening on http://localhost:${PORT}/`)
})
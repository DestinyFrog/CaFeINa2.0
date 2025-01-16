import Express from 'express'
import MoleculaRepository from '../repositories/moleculaRepository.js'
import ElementModel from '../models/elementModel.js'
import { CONDITION } from '../lib/repository.js'
import { t_string } from '../lib/util.js'
import log from '../lib/log.js'

const router = Express.Router()

router.get("/", async (req, res) => {
	try {
		const repo = new MoleculaRepository()

		const data = await repo
			.get_all()
			.read_it()

		res.json(data)
	}
	catch(err) {
		log.write(err as Error)

		res.status(500)
			.json(err)
	}
})

router.get("/:id", async (req, res) => {
	try {
		const id = parseInt( req.params.id )
		const repo = new MoleculaRepository()

		const data = await repo
			.get_one_by_id(id)
			.read_it() as ElementModel[]

		if ( data.length > 0 ) {
			const molecula: any = data[0]
			res.json(molecula)
		}
		else {
			res.status(404)
				.send("molecula não encontrada")
		}
	}
	catch(err) {
		log.write(err as Error)

		res.status(500)
			.json(err)
	}
})

router.get("/search/:term", async (req, res) => {
	try {
		const term :string = req.params.term
		const repo = new MoleculaRepository()

		const data = await repo
			.search_for(term)
			.read_it()

		res.json(data)
	}
	catch(err) {
		log.write(err as Error)

		res.status(500)
			.json(err)
	}
})

router.get("/mix/:term", async (req, res) => {
	try {
		const term :string = req.params.term
		const repo = new MoleculaRepository()

		const data = await repo
			.condition("term", CONDITION.EQUAL, t_string(term))
			.where()
			.get_all()
			.read_it()

		if ( data.length > 0 ) {
			const molecula: any = data[0]
			res.json(molecula)
			return
		}
		else {
			res.status(200).json(null)
		}
	}
	catch(err) {
		log.write(err as Error)

		res.status(500)
			.json(err)
	}
})

export default router
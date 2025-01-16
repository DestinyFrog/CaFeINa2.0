import { Request, Response } from "express"
import ElementModel from "../models/elementModel.js"
import ElementRepository from "../repositories/elementRepository.js"
import MoleculaRepository from "../repositories/moleculaRepository.js"
import MoleculaModel from "../models/moleculaModel.js"
import Log from "../lib/log.js"

export interface SearchObject {
	id: number
	label: string
	tag: string
}

async function search_element(term:string) {
	const repo = new ElementRepository()

	const data = await repo
		.search_for(term)
		.get_all()
		.read_it() as unknown as ElementModel[]

	return data.map((el) => add_tag({
		id: el.id,
		label: `${el.atomic_number}. ${el.oficial_name} (${el.symbol})`
	}, "element"))
}

async function search_molecula(term:string) {
	const repo = new MoleculaRepository()

	const data = await repo
		.search_for(term)
		.get_all()
		.read_it() as unknown as MoleculaModel[]

	return data.map((el) => add_tag({
		id: el.id,
		label: `${el.popular_name}`
	}, "molecula"))
}

function add_tag(simple_search: { id: number, label: string }, tag:string) {
	return { ... simple_search, tag }
}

async function general_search(term:string): Promise<SearchObject[]> {
	const elements = await search_element(term)
	const moleculas = await search_molecula(term)

	return [
		... elements,
		... moleculas
	]
}

async function search_route(req:Request, res:Response) {
	const term = req.params.term as string
	general_search(term)
	.then(data => {
		res.json(data)
	})
	.catch((err:Error) => {
		Log.write(err)
		res.status(500)
			.end(err)
	})
}

export default search_route
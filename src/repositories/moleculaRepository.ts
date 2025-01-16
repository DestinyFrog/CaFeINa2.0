import Repository, { CONDITION } from "../lib/repository.js"
import { t_general_string } from "../lib/util.js"
import MoleculaModel, { MoleculaType } from "../models/moleculaModel.js"

class MoleculaRepository extends Repository {
	protected table_name: string = "molecula"

	protected fields = [
		"iupac_name",
		"another_names",
		"characteristics",
		"xyz",
		"xy",
		"organic",
		"term",
		"formula",
		"popular_name"
	]

	public search_for(term:string) {
		term = t_general_string(term)
		this
			.condition("iupac_name", CONDITION.LIKE, term, "OR" )
			.condition("another_names", CONDITION.LIKE, term, "OR" )
			.condition("popular_name", CONDITION.LIKE, term, "OR" )
			.condition("formula", CONDITION.LIKE, term, "OR" )
			.condition("characteristics", CONDITION.LIKE, term, "OR" )
			.condition("organic", CONDITION.LIKE, term )
			.where()
		return this
	}

	protected process_data({ _id, iupac_name, another_names, characteristics, xyz, xy, organic, formula, popular_name, term }: any): MoleculaModel {
		return {
			id: <number> _id,
			iupac_name: <string> iupac_name,
			another_names: JSON.parse(<string> another_names),
			characteristics: JSON.parse(<string> characteristics),
			xyz: <string> xyz,
			xy: <string> xy,
			organic: organic as MoleculaType,
			formula: formula as string,
			popular_name: popular_name as string,
			term: term as string
		}
	}


}

export default MoleculaRepository
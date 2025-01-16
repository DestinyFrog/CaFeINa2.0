import Repository, { CONDITION } from "../lib/repository.js"
import ElementModel, { Category, Fase } from "../models/elementModel.js"
import { t_general_string } from "../lib/util.js"

class ElementRepository extends Repository {
	protected table_name: string = "element"

	protected fields = [
		"atomic_number",
		"oficial_name",
		"latin_name",
		"atomic_radius",
		"category",
		"atomic_mass",
		"eletronegativity",
		"period",
		"family",
		"symbol",
		"fase",
		"xpos",
		"ypos",
		"layers",
		"electronic_configuration",
		"oxidation_state",
		"discovery_year",
		"discovery",
		"another_names"
	]

	public search_for(term:string) {
		const s_term = t_general_string(term)
		this
			.condition("symbol", CONDITION.LIKE, s_term, "OR" )
			.condition("oficial_name", CONDITION.LIKE, s_term, "OR" )
			.condition("another_names", CONDITION.LIKE, s_term, "OR" )
			.condition("discovery_year", CONDITION.LIKE, s_term, "OR" )
			.condition("atomic_number", CONDITION.LIKE, s_term, "OR" )
			.condition("another_names", CONDITION.LIKE, s_term, "OR" )
			.condition("discovery", CONDITION.LIKE, s_term )
			.where()
		return this
	}

	protected process_data({_id, atomic_number, oficial_name, latin_name, atomic_radius, category, atomic_mass, eletronegativity, period, family, symbol, fase, xpos, ypos, layers, electronic_configuration, oxidation_state, discovery_year, discovery, another_names}: any): ElementModel {
		const real_category = this.stringToCategory(<string> category)
		
		return {
			id: <number> _id,
			atomic_number: <number> atomic_number,
			oficial_name: <string> oficial_name,
			latin_name: (<string> latin_name) || null,
			atomic_radius: (<number> atomic_radius) || null,
			category: real_category,
			atomic_mass: (<number> atomic_mass) || null,
			eletronegativity: (<number> eletronegativity) || null,
			period: <number> period,
			family: <number> family,
			symbol: <string> symbol,
			fase: this.stringToFase(<string> fase),
			pos: {
				x: <number> xpos,
				y: <number> ypos
			},
			color: this.categoryToColor(real_category),
			layers: JSON.parse(<string> layers),
			discovery_year: <number> discovery_year,
			discovery: JSON.parse(<string> discovery),
			another_names: JSON.parse(<string> another_names)
		}
	}

	protected categoryToColor(category:Category): string {
		switch(category) {
			case Category.HYDROGEN:				return "#8c0250"
			case Category.NOBLE_GAS:			return "#9400d3"
			case Category.ALKALI_METAL:			return "#e5b80b"
			case Category.ALKALINE_EARTH_METAL:	return "#ff6600"
			case Category.NONMETAL:				return "#008000"
			case Category.HALOGEN:				return "#304ee6"
			case Category.TRANSITION_METAL:		return "#970700"
			case Category.ANOTHER_METAL:		return "#ff007f"
			case Category.SEMIMETAL:			return "#aa007a"
			case Category.LANTHANIDE:			return "#054f77"
			case Category.ACTINIDE:				return "#4169e1"
			default:							return "#333333"
		}
	}

	protected stringToCategory(category:string): Category {
		switch(category) {
			case 'hidrogênio':				return Category.HYDROGEN
			case 'gás nobre':				return Category.NOBLE_GAS
			case 'metal alcalino':			return Category.ALKALI_METAL
			case 'metal alcalino terroso':	return Category.ALKALINE_EARTH_METAL
			case 'ametal':					return Category.NONMETAL
			case 'halogênio':				return Category.HALOGEN
			case 'metal de transição':		return Category.TRANSITION_METAL
			case 'outros metais':			return Category.ANOTHER_METAL
			case 'semimetal':				return Category.SEMIMETAL
			case 'desconhecido':			return Category.UNKNOWN
			case 'lantanídeo':				return Category.LANTHANIDE
			case 'actinídeo':				return Category.ACTINIDE
			default:						return Category.UNKNOWN
		}
	}
	
	protected stringToFase(fase:string): Fase {
		switch(fase) {
			case 'S':				return Fase.SOLID
			case 'L':				return Fase.LIQUID
			case 'G':				return Fase.GAS
			default:				return Fase.SOLID
		}
	}
}

export default ElementRepository
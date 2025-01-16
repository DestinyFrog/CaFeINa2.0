
export interface MoleculaUnit {
	x: number,
	y: number,
	z: number,
	symbol: number,
	radius: number,
	color: number
}

export enum MoleculaType {
	ORGANIC = "organic",
	INORGANIC = "inorganic"
}

interface MoleculaModel {
	id: number,
	iupac_name: string,
	another_names: string[],
	characteristics: string[],
	xyz: string,
	xy: string,
	organic: MoleculaType,
	popular_name: string,
	term: string,
	formula: string
}

export default MoleculaModel
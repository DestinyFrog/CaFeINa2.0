import ElementModel, { Category } from "../models/elementModel.js"
import ElementRepository from "../repositories/elementRepository.js"
import dotenv from 'dotenv'

(async () => {
	dotenv.config()

	const repo = new ElementRepository()
	const data = await repo.get_all().read_it() as unknown as ElementModel[]

	const halogenios = data
		.filter(({category, symbol}) => category == Category.HALOGEN && symbol != 'At')

	const metais_alcalinos = data
		.filter(({category}) => category == Category.ALKALI_METAL)

	const metais_alcalinos_terrosos = data
		.filter(({category, symbol}) => category == Category.ALKALINE_EARTH_METAL && symbol != 'Ra')

	const metais_de_transicao = data
		.filter(({category, symbol, atomic_radius}) => category == Category.TRANSITION_METAL && atomic_radius)

	const oxigenio = data
		.find(({symbol}) => symbol == "O")!

	const hidrogenio = data
		.find(({symbol}) => symbol == "H")!

	const sais = []

	const halogenios_nomes = {
		"F": "fluoreto",
		"Cl": "cloreto",
		"Br": "brometo",
		"I": "iodeto"
	}

	metais_alcalinos.forEach( metal_alcalino => {
		halogenios!.forEach( halogenio => {
			const formula = `${metal_alcalino.symbol}${halogenio.symbol}`
			const term = [ metal_alcalino.symbol, halogenio.symbol ].sort().join("")
			const nome = `${ halogenios_nomes[halogenio.symbol] } de ${ metal_alcalino.oficial_name }`
			const xy = `${metal_alcalino.symbol} -0.5 0|${halogenio.symbol} 0.5 0`

			const distancia = (halogenio.atomic_radius! + metal_alcalino.atomic_radius! + 20) / 2
			const xyz = `${metal_alcalino.symbol} 0 ${distancia.toFixed(2)} 0|${halogenio.symbol} 180 ${distancia.toFixed(2)} 0`
			const caracteristicas = '["sal"]'

			sais.push({
				formula,
				term,
				nome,
				xy,
				xyz,
				caracteristicas
			} as never)
		} )

		const formula = `${metal_alcalino.symbol}OH`
		const term = [ metal_alcalino.symbol, "O", "H" ].sort().join("")
		const pnome = `hidróxido de ${ metal_alcalino.oficial_name }`
		const nome = `hidróxido de ${ metal_alcalino.oficial_name } (I)`
		const xy = `${metal_alcalino.symbol} -0.819 0.573|O 0 0 0|H 0.79 0.61 0$1 s`

		const distancia = (oxigenio.atomic_radius! + metal_alcalino.atomic_radius! + 30)
		const xyz = `O 0 0 0|H 0 61.26 79.05|${metal_alcalino.symbol} 180 ${ (0.819 * distancia).toFixed(2) } ${ (0.573 * distancia).toFixed(2) }`
		const caracteristicas = '["base","base de arrhenius","hidróxido"]'

		sais.push({
			formula,
			term,
			nome,
			pnome,
			xy,
			xyz,
			caracteristicas
		} as never)
	} )

	metais_alcalinos_terrosos.forEach( metal_alcalino_terroso => {
		halogenios!.forEach( halogenio => {
			const formula = `${metal_alcalino_terroso.symbol}${halogenio.symbol}<2>`
			const term = [ metal_alcalino_terroso.symbol, halogenio.symbol, halogenio.symbol ].sort().join("")
			const nome = `${ halogenios_nomes[halogenio.symbol] } de ${ metal_alcalino_terroso.oficial_name }`
			const xy = `${halogenio.symbol} -1 0|${metal_alcalino_terroso.symbol} 0 0|${halogenio.symbol} 1 0`

			const distancia = (halogenio.atomic_radius! + metal_alcalino_terroso.atomic_radius! + 20)
			const xyz = `${halogenio.symbol} 0 ${distancia.toFixed(2)} 0|${metal_alcalino_terroso.symbol} 0 0 0|${halogenio.symbol} 180 ${distancia.toFixed(2)} 0`
			const caracteristicas = '["sal"]'

			sais.push({
				formula,
				term,
				nome,
				xy,
				xyz,
				caracteristicas
			} as never)
		} )

		const formula = `${metal_alcalino_terroso.symbol}${oxigenio.symbol}`
		const term = [ metal_alcalino_terroso.symbol, oxigenio.symbol ].sort().join("")
		const nome = `monóxido de ${ metal_alcalino_terroso.oficial_name }`
		const xy = `${metal_alcalino_terroso.symbol} -0.5 0 0|O 0.5 0 0$2 s`

		const distancia = (oxigenio.atomic_radius! + metal_alcalino_terroso.atomic_radius! + 20) / 2
		const xyz = `O 0 ${distancia.toFixed(2)} 0|${metal_alcalino_terroso.symbol} 180 ${distancia.toFixed(2)} 0`
		const caracteristicas = '["óxido"]'

		sais.push({
			formula,
			term,
			nome,
			xy,
			xyz,
			caracteristicas
		} as never)

		// hidroxido
		const formula1 = `${metal_alcalino_terroso.symbol}(OH)²`
		const term1 = [ metal_alcalino_terroso.symbol, "O", "H", "O", "H" ].sort().join("")
		const pnome1 = `hidróxido de ${ metal_alcalino_terroso.oficial_name }`
		const nome1 = `hidróxido de ${ metal_alcalino_terroso.oficial_name } (II)`
		const xy1 = `${metal_alcalino_terroso.symbol} 0 0|O 0.79 0.61 0|H 1.58 0 0|O -0.79 0.61 1|H -1.58 0 1$1 s|1 s`

		const distancia1 = (oxigenio.atomic_radius! + metal_alcalino_terroso.atomic_radius! + 20)
		const xyz1 = `${metal_alcalino_terroso.symbol} 0 0 0|O 0 ${((Math.sqrt(3)/2) * distancia1).toFixed(2)} ${(distancia1/2).toFixed(2)}|H 0 ${(((Math.sqrt(3)/2) * distancia1) + ((1/2) * 101) ).toFixed(2) } ${(((1/2) * distancia1) - ((Math.sqrt(3)/2) * 101) ).toFixed(2) }|O 180 ${((Math.sqrt(3)/2) * distancia1).toFixed(2)} ${(distancia1/2).toFixed(2)}|H 180 ${(((Math.sqrt(3)/2) * distancia1) + ((1/2) * 101) ).toFixed(2) } ${(((1/2) * distancia1) - ((Math.sqrt(3)/2) * 101) ).toFixed(2) }`
		const caracteristicas1 = '["base","base de arrhenius","hidróxido"]'

		sais.push({
			formula:formula1,
			term:term1,
			nome:nome1,
			pnome:pnome1,
			xy:xy1,
			xyz:xyz1,
			caracteristicas:caracteristicas1
		} as never)
	} )

	const sql = sais.map(({formula, term, nome, pnome, xy, xyz, caracteristicas}:any) => 
`('inorgânico','${formula}','${term}','${nome}','${pnome||nome}','[]',
	'${xyz}',
	'${xy}',
	'${caracteristicas}'
)`
	)
	.join(",\n")

	console.log(sql)

}).call(this)
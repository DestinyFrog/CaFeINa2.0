import MoleculaModel from "../../../src/models/moleculaModel"
import ElementApp from "../app/ElementApp"
import Molecula2DApp from "../app/Molecula2DApp"
import MoleculaApp from "../app/MoleculaApp"
import { API_URL } from "../configuration"
import App from "../widgets/app"
import ErrorApp from "../widgets/errorApp"

class Mixer {
	public txt: string = ""
	public sum: (App|null|undefined)[] = []
	public molecula: MoleculaModel | null = null

	public async mix_it( app:App) {
		const position = app.position
		const size = app.size

		this.sum = App
			.filter_by_tag(["element", "molecula"])
			.map( (any_app:App|null) => {
				if (any_app == null) return
				if (any_app.id == app.id) return

				const any_position = any_app.position
				const any_size = any_app.size

				if (
					position.x + size.x > any_position.x &&
					position.x < any_position.x + any_size.x &&
					position.y + size.y > any_position.y &&
					position.y < any_position.y + any_size.y
				) {
					return any_app
				}

				return null
			} )
			.filter(s => s)

		if (this.sum.length > 0) {
			this.sum.push(app)
			const txt = this.sum.reduce((prev:any[], d:ElementApp|MoleculaApp) => {
				if (d.tag == "molecula") {
					return [ ... prev, ... d.molecula.term.match(/[A-Z][a-z]?/g) ]
				}
				else if (d.tag == "element") {
					return [ ... prev, d.element.symbol ]
				}
			}, [])!.sort().join("")

			console.log(txt)

			if (txt != this.txt && txt != "") {
				this.txt = txt
				this.load_molecula()
				.then(() => {
					this.play()
				})
				.catch((err) => {
					const a = new ErrorApp(err)
					a.Start()
				})
			}
		}
	}

	public play() {
		if (this.molecula && this.molecula.id) {
			const pos = this.sum[0]!.position

			const b = new Molecula2DApp(this.molecula)
			b.position = pos
			b.Start()

			this.sum.forEach((d:any) => d.Close())
			this.txt = ""
			this.molecula = null
		}
	}

	public async load_molecula() {
		console.log(this.txt)

		const res = await fetch(`${API_URL}/molecula/mix/${this.txt}`)
		const data = await res.json()

		if (data && data.id) {
			this.molecula = data
		}
		else {
			this.molecula = null
		}
	}
}

const mixer = new Mixer()
export default mixer
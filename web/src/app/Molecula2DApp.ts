import './Molecula2DApp.css'

import MoleculaModel from "../../../src/models/moleculaModel"
import App from "../widgets/app"
import MoleculaApp from "./MoleculaApp"
import Mixer from "../services/Mixer"

class Molecula2DApp extends App {
	private canvas: HTMLCanvasElement
	private ctx:CanvasRenderingContext2D
	private molecula: MoleculaModel

	private atoms: any[] = []
	private ligations: any[] = []

	private width = 200
	private height = 200
	private center = { x: 0, y: 0 }

	private readonly bounds = 20
	private readonly distance_atoms = 40
	private readonly distance_ligations = 14
	private readonly mutiple_ligation_distance = 0.2

	constructor(molecula:MoleculaModel) {
		super("", "molecula")

		this.molecula = molecula

		const unnecessary_div = document.createElement('div')
		this.appendToContent(unnecessary_div)
		unnecessary_div.className = 'unnecessary-div'

		this.canvas = document.createElement('canvas')
		this.ctx = this.canvas.getContext('2d')!
		// this.appendToContent(this.canvas)
		unnecessary_div.appendChild(this.canvas)

		const button = document.createElement('button')
		button.textContent = '3D'
		button.addEventListener('click', () => {
			const a = new MoleculaApp(molecula)
			a.position = this.position
			a.Start()
		})
		this.appendToFooter(button)

		this.div_content.style.display = 'flex'
		this.div_content.style.alignItems = 'center'
	}

	private configCanvas() {
		const bounds = this.atoms.reduce(( prev, {x, y} ) => {
			if (x > prev.max_x) prev.max_x = x
			if (y > prev.max_y) prev.max_y = y
			if (x < prev.min_x) prev.min_x = x
			if (y < prev.min_y) prev.min_y = y
			return prev
		}, { max_x: 0, max_y: 0, min_x: 0, min_y: 0 })

		this.width = this.bounds*2 + (bounds.max_x + -bounds.min_x)
		this.height = this.bounds*2 + (bounds.max_y + -bounds.min_y)

		this.center.x = -bounds.min_x + this.bounds
		this.center.y = -bounds.min_y + this.bounds

		this.canvas.width = this.width
		this.canvas.height = this.height

		this.ctx.fillStyle = "black"
		this.ctx.fillRect(0, 0, this.width, this.height)

		this.ctx.textBaseline = 'middle'
		this.ctx.textAlign = 'center'
		this.ctx.fillStyle = "white"
		this.ctx.strokeStyle = "white"
		this.ctx.font = '15px Arial'
	}

	protected Render(): void {
		this.title = this.molecula.popular_name

		const [atoms_str, ligations_str] = this.molecula.xy.split("$")

		if (!atoms_str) return
	
		if (ligations_str) {
			ligations_str.split("|").forEach(ligation_str => {
				const [ eletrons, type ] = ligation_str.split(' ')
				this.ligations.push( { eletrons, type, pos: [] } )
			})
		}

		atoms_str.split("|").forEach(atom_str => {
			let [ symbol, str_x, str_y, ... ligations ] = atom_str.split(' ')
			
			let x = parseFloat(str_x) * this.distance_atoms
			let y = parseFloat(str_y) * this.distance_atoms

			ligations.forEach(l => {
				this.ligations[parseInt(l)].pos.push( { x, y } )
			})
			
			this.atoms.push( { symbol, x, y } )		
		})

		this.configCanvas()

		this.atoms.forEach(({symbol, x, y}) => {
			this.ctx.fillText(symbol, this.center.x + x, this.center.y + y)
		})

		this.ligations.forEach(({type, eletrons, pos: [{x:x1, y:y1}, {x:x2, y:y2}]}) => {
			this.ctx.beginPath()

			const ang = Math.atan2(y2-y1,x2-x1)

			if (eletrons == 1) {
				this.ctx.moveTo(this.center.x + x1 + Math.cos(ang)*this.distance_ligations, this.center.y + y1 + Math.sin(ang)*this.distance_ligations)
				this.ctx.lineTo(this.center.x + x2 + Math.cos(ang+Math.PI)*this.distance_ligations, this.center.y + y2  + Math.sin(ang+Math.PI)*this.distance_ligations)
			}

			if (eletrons == 2) {
				this.ctx.moveTo(this.center.x + x1 + Math.cos(ang+this.mutiple_ligation_distance) * this.distance_ligations, this.center.y + Math.sin(ang-this.mutiple_ligation_distance) * this.distance_ligations)
				this.ctx.lineTo(this.center.x + x2 + Math.cos(ang + Math.PI-this.mutiple_ligation_distance) * this.distance_ligations, this.center.y + y2 + Math.sin(ang + Math.PI+this.mutiple_ligation_distance) * this.distance_ligations)
				
				this.ctx.moveTo(this.center.x + x1 + Math.cos(ang-this.mutiple_ligation_distance) * this.distance_ligations, this.center.y + Math.sin(ang+this.mutiple_ligation_distance) * this.distance_ligations)
				this.ctx.lineTo(this.center.x + x2 + Math.cos(ang + Math.PI+this.mutiple_ligation_distance) * this.distance_ligations, this.center.y + y2 + Math.sin(ang + Math.PI-this.mutiple_ligation_distance) * this.distance_ligations)
			}

			/*
			if (eletrons == 3) {
				this.ctx.moveTo(this.center.x + x1 + Math.cos(ang) * this.distance_ligations, this.center.y + Math.sin(ang) * this.distance_ligations)
				this.ctx.lineTo(this.center.x + x2 + Math.cos(ang + Math.PI) * this.distance_ligations, this.center.y + y2 + Math.sin(ang + Math.PI) * this.distance_ligations)

				this.ctx.moveTo(this.center.x + x1 + Math.cos(ang+this.mutiple_ligation_distance*2) * this.distance_ligations, this.center.y + Math.sin(ang-this.mutiple_ligation_distance*2) * this.distance_ligations)
				this.ctx.lineTo(this.center.x + x2 + Math.cos(ang + Math.PI-this.mutiple_ligation_distance*2) * this.distance_ligations, this.center.y + y2 + Math.sin(ang + Math.PI+this.mutiple_ligation_distance*2) * this.distance_ligations)
				
				this.ctx.moveTo(this.center.x + x1 + Math.cos(ang-this.mutiple_ligation_distance*2) * this.distance_ligations, this.center.y + Math.sin(ang+this.mutiple_ligation_distance*2) * this.distance_ligations)
				this.ctx.lineTo(this.center.x + x2 + Math.cos(ang + Math.PI+this.mutiple_ligation_distance*2) * this.distance_ligations, this.center.y + y2 + Math.sin(ang + Math.PI-this.mutiple_ligation_distance*2) * this.distance_ligations)
			}
			*/

			this.ctx.stroke()
		})
	}

	protected on_drop() {
		Mixer.mix_it(this)
	}
}

export default Molecula2DApp
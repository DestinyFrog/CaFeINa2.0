import './Snake.css'
import ElementModel from "../../../src/models/elementModel"
import { API_URL } from "../configuration"
import { generateRandomVec2, Vec2 } from "../util"
import App from "../widgets/app"
import ErrorApp from "../widgets/errorApp"

class Snake extends App {
	private menu: HTMLDivElement
	private but_open_controls: HTMLButtonElement
	private canvas: HTMLCanvasElement
	private ctx: CanvasRenderingContext2D

	private delay = 150
	private unit = 28
	private rows = 12
	private cols = 12

	private width: number
	private height: number

	private snake_body: Vec2[] = []
	private snake_dir: Vec2 = { x: 0, y: 1 }
	private fruit: Vec2
	private is_dead = false

	private elements: { symbol: string, color: string }[] | null = null

	constructor() {
		super("SNaK", "snake")

		this.width = this.unit * this.cols;
		this.height = this.unit * this.rows;

		this.snake_body.push({ x: Math.floor(this.cols / 2), y: Math.floor(this.rows / 2) })
		this.fruit = generateRandomVec2(this.cols, this.rows)

		this.canvas = document.createElement('canvas')
		this.canvas.width = this.width
		this.canvas.height = this.height
		this.appendToContent(this.canvas)

		this.but_open_controls = document.createElement('button')
		this.but_open_controls.textContent = 'Controles'
		this.but_open_controls.addEventListener('click', () => this.openMenu())
		this.appendToFooter(this.but_open_controls)

		this.menu = document.createElement('div')
		this.menu.className = 'controls'
		this.appendToContent(this.menu)
		
		const up_button = document.createElement('button')
		up_button.textContent = '🔼'
		up_button.addEventListener('click', () => {
			this.snake_dir.x = 0
			this.snake_dir.y = -1
		})
		this.menu.appendChild(up_button)

		const down_button = document.createElement('button')
		down_button.textContent = '🔽'
		down_button.addEventListener('click', () => {
			this.snake_dir.x = 0
			this.snake_dir.y = 1
		})
		this.menu.appendChild(down_button)

		const left_button = document.createElement('button')
		left_button.textContent = '◀️'
		left_button.addEventListener('click', () => {
			this.snake_dir.x = -1
			this.snake_dir.y = 0
		})
		this.menu.appendChild(left_button)
		
		const right_button = document.createElement('button')
		right_button.textContent = '▶️'
		right_button.addEventListener('click', () => {
			this.snake_dir.x = 1
			this.snake_dir.y = 0
		})
		this.menu.appendChild(right_button)

		this.ctx = this.canvas.getContext('2d')!
	}

	private openMenu() {
		this.menu.style.display = (this.menu.style.display == 'none') ? 'grid' : 'none'
	}

	private outFunction = (ev: KeyboardEvent) => this.KeyDown(ev)

	protected Render(): void {
		this.ctx.textAlign = 'center'
		this.ctx.textBaseline = 'middle'
		this.ctx.font = '16px Courier new, monospace'

		this.getElements()
			.then(() => {
				if (this.elements) {
					requestAnimationFrame(() => this.Loop())
					document.body.addEventListener('keydown', this.outFunction)
				}
			})
			.catch(err => {
				const a = new ErrorApp(err)
				a.Start()
			})
	}

	protected Destroy(): void {
		document.body.removeEventListener('keydown', this.outFunction)
	}

	private async getElements() {
		const resp = await fetch(`${API_URL}/element`)
		const data = await resp.json() as unknown as ElementModel[]
		this.elements = data.map(({ symbol, color }: ElementModel) => ({ symbol, color }))
	}

	private KeyDown({ keyCode }: KeyboardEvent) {
		switch (keyCode) {
			case 38: // ArrowUp
				this.snake_dir.x = 0
				this.snake_dir.y = -1
				break

			case 40: // ArrowDown
				this.snake_dir.x = 0
				this.snake_dir.y = 1
				break

			case 37: // ArrowLeft
				this.snake_dir.x = -1
				this.snake_dir.y = 0
				break

			case 39: // ArrowRight
				this.snake_dir.x = 1
				this.snake_dir.y = 0
				break
		}
	}

	private fruitInsideBody() {
		for (let i = this.snake_body.length - 1; i > 0; i--) {
			if (
				this.fruit.x == this.snake_body[i].x &&
				this.fruit.y == this.snake_body[i].y
			) {
				return true
			}
		}
		return false
	}

	private Loop() {
		for (let i = this.snake_body.length - 1; i > 0; i--) {
			this.snake_body[i].x = this.snake_body[i - 1].x
			this.snake_body[i].y = this.snake_body[i - 1].y
		}

		this.snake_body[0].x += this.snake_dir.x
		this.snake_body[0].y += this.snake_dir.y

		if (this.snake_body[0].x >= this.rows) {
			this.snake_body[0].x = 0
		}

		if (this.snake_body[0].y >= this.cols) {
			this.snake_body[0].y = 0
		}

		if (this.snake_body[0].x < 0) {
			this.snake_body[0].x = this.rows - 1
		}

		if (this.snake_body[0].y < 0) {
			this.snake_body[0].y = this.cols - 1
		}

		if (this.fruit.x == this.snake_body[0].x && this.fruit.y == this.snake_body[0].y) {
			do {
				this.fruit = generateRandomVec2(this.cols, this.rows)
			} while( this.fruitInsideBody() )
			this.snake_body.push({ x: -1, y: -1 })
		}

		if (this.is_dead) {
			if (this.snake_body.length <= 1) {
				this.is_dead = false
			} else {
				this.snake_body.pop()
			}
		}

		for (let i = this.snake_body.length - 1; i > 0; i--) {
			if (
				this.snake_body[0].x == this.snake_body[i].x &&
				this.snake_body[0].y == this.snake_body[i].y
			) {
				this.is_dead = true
			}
		}

		this.ctx.fillStyle = '#000000'
		this.ctx.fillRect(0, 0, this.width, this.height)

		this.ctx.strokeStyle = '#aaaaaa'

		/*
		for (let i = 0; i < this.cols; i++) {
			this.ctx.moveTo(i * this.unit, 0)
			this.ctx.lineTo(i * this.unit, this.height)
		}

		for (let i = 0; i < this.rows; i++) {
			this.ctx.moveTo(0, i * this.unit)
			this.ctx.lineTo(this.width, i * this.unit)
		}

		this.ctx.stroke()
		*/

		this.snake_body.forEach(({ x, y }, idx) => {
			this.ctx.fillStyle = this.elements![idx].color
			this.ctx.fillRect(x * this.unit + 1, y * this.unit + 1, this.unit - 2, this.unit - 2)

			this.ctx.fillStyle = '#ffffff'
			this.ctx.fillText(this.elements![idx].symbol, x * this.unit + this.unit / 2, y * this.unit + this.unit / 2)
		})

		this.ctx.fillStyle = '#ffffff'
		this.ctx.fillRect(this.fruit.x * this.unit + 1, this.fruit.y * this.unit + 1, this.unit - 2, this.unit - 2)
		this.ctx.fillStyle = '#000000'
		this.ctx.fillText(this.elements![this.snake_body.length].symbol,
			this.fruit.x * this.unit + this.unit / 2,
			this.fruit.y * this.unit + this.unit / 2)

		setTimeout(() => {
			requestAnimationFrame(() => this.Loop())
		}, this.delay)
	}
}

export default Snake
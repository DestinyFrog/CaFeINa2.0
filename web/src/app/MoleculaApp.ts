import { API_URL } from "../configuration"
import { DegreesToRadians } from "../util"
import App from "../widgets/app"
import { Scene, PerspectiveCamera, WebGLRenderer, GridHelper, Mesh, MeshBasicMaterial, SphereGeometry } from 'three'
import { OrbitControls } from 'three/addons/controls/OrbitControls.js'

class MoleculaApp extends App {
	public molecula: any = null
	private atoms_cache: any = {}

	private width: number = 200
	private height: number = 170

	private bigger_r = 0
	private bigger_z = 0

	private camera_distance = 200
	private camera_angle = 30

	private scene: Scene
	private camera: PerspectiveCamera
	private renderer: WebGLRenderer
	private controls: OrbitControls

	constructor(molecula: Object) {
		super("", "molecula")
		this.molecula = molecula
		this.scene = new Scene()
		this.camera = new PerspectiveCamera(75, this.width / this.height, 0.1, 5000)
		this.renderer = new WebGLRenderer();
		this.controls = new OrbitControls(this.camera, this.renderer.domElement)
	}

	protected Render(): void {
		this.renderer.setPixelRatio(window.devicePixelRatio)
		this.appendToContent(this.renderer.domElement);

		this.title = this.molecula.iupac_name
		this.renderer.setSize(this.width, this.height)

		const grid = new GridHelper(10000, 30)
		this.scene.add(grid)

		const atoms = this.processTRZ()

		this.camera.position.z = Math.cos(DegreesToRadians(this.camera_angle)) * (this.bigger_r + this.camera_distance);
		this.camera.position.x = Math.sin(DegreesToRadians(this.camera_angle)) * (this.bigger_r + this.camera_distance);
		this.camera.position.y = 132 + this.camera_distance + this.bigger_z
		this.camera.rotation.y = DegreesToRadians(this.camera_angle)
		
		atoms.forEach(async ({ symbol, t, r, z }: any) => {
			let data:any = null
			if (this.atoms_cache[symbol]) {
				data = this.atoms_cache[symbol]
			} else {
				const res = await fetch(`${API_URL}/element/symbol/${symbol}`)
				data = await res.json()
			}

			let radius = 60
			if (data) {
				if (data.atomic_radius) {
					radius = data.atomic_radius
				}
			}

			const geometry = new SphereGeometry(radius)

			let color = '#ffffff'

			switch (symbol) {
				case 'O': color = '#00ff00'; break
				case 'H': color = '#aaffaa'; break
				case 'C': color = '#555555'; break
				case 'Na': color = '#ffff00'; break
				case 'Cl': color = '#00ffff'; break
				case 'F': color = '#aaaaff'; break
				case 'N': color = '#5e4d85'; break
				case 'S': color = '#dddd00'; break
				case 'P': color = '#ffa500'; break
			}

			const material = new MeshBasicMaterial({ color })

			const sphere = new Mesh(geometry, material)
			sphere.position.x = Math.cos(DegreesToRadians(t)) * r
			sphere.position.z = Math.sin(DegreesToRadians(t)) * r
			sphere.position.y = -z + (this.bigger_z/4*3) + 132

			this.scene.add(sphere)
		})

		requestAnimationFrame(() => this.loop())
	}

	protected loop() {
		this.controls.update();
		this.renderer.render(this.scene, this.camera)
		requestAnimationFrame(() => this.loop())
	}

	processTRZ() {
		const atoms: any[] = []
		this.molecula.xyz.split("|").forEach((line: any) => {
			let [symbol, x, y, w] = line.split(" ")
			let t = parseInt(x)
			let r = parseInt(y)
			if (r > this.bigger_r) this.bigger_r = r
			let z = parseInt(w)
			if (z > this.bigger_z) this.bigger_z = z
			atoms.push({ symbol, t, r, z })
		})
		return atoms
	}

}

export default MoleculaApp
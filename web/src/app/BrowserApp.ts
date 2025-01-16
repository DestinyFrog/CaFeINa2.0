import './BrowserApp.css'

import { SearchObject } from "../../../src/service/Search"
import ElementModel from "../../../src/models/elementModel"
import { API_URL } from "../configuration"
import App from "../widgets/app"
import ElementApp from './ElementApp'
import ErrorApp from '../widgets/errorApp'
import Molecula2DApp from './Molecula2DApp'

class BrowserApp extends App {
	private button_search: HTMLButtonElement
	private input_search: HTMLInputElement
	private ul_recomendation: HTMLUListElement

	private icons = {
		"element": "/search_element.svg"
	}

	constructor() {
		super("Navegador", "search")

		const div_search = document.createElement('div')
		div_search.className = 'div-search'
		this.appendToContent(div_search)

		this.input_search = document.createElement('input')
		this.input_search.type = 'text'
		this.input_search.className = 'browser-input'

		this.button_search = document.createElement('button')
		this.button_search.className = "search-button"

		div_search.appendChild(this.input_search)
		div_search.appendChild(this.button_search)

		const img = document.createElement('img')
		img.src = '/icon_search.svg'
		img.alt = 'search'
		img.style.height = '15px'
		this.button_search.appendChild(img)

		this.ul_recomendation = document.createElement('ul')
		this.ul_recomendation.className = 'recomendation'
	}

	protected Render(): void {
		// this.appendToContent(this.input_search)
		// this.appendToContent(this.button_search)

		this.input_search.focus()
		this.input_search.select()

		this.button_search.addEventListener('click', () => {
			this.Search()
		})

		this.appendToContent(this.ul_recomendation)
		this.input_search.addEventListener('input', () => {
			this.Search()
		})
	}

	public async Search() {
		const term = this.input_search.value

		if (term == '')
			return

		fetch(`${API_URL}/search/${term}`)
			.then(res => res.json())
			.then((data: SearchObject[]) => {
				this.ul_recomendation.innerHTML = ''
				data.forEach(search_object => {
					const li = this.treatTag(search_object)!

					if (li)
						this.ul_recomendation.appendChild(li)
				})
			})
	}

	private treatTag(search_object: SearchObject) {
		const li = document.createElement('li')


		switch (search_object.tag) {

			case 'element':
				li.textContent = search_object.label
				li.addEventListener('click', () => {
					fetch(`${API_URL}/element/${search_object.id}`)
						.then(res => res.json())
						.then((data: ElementModel) => {
							const a = new ElementApp(data)
							a.Start()
						})
						.catch(err => {
							const a = new ErrorApp(err)
							a.Start()
						})
				})
				return li

			case 'molecula':
				li.textContent = search_object.label
				li.addEventListener('click', () => {
					fetch(`${API_URL}/molecula/${search_object.id}`)
						.then(res => res.json())
						.then((data: any) => {
							const a = new Molecula2DApp(data)
							a.Start()
						})
						.catch(err => {
							const a = new ErrorApp(err)
							a.Start()
						})
				})
				return li

		}
	}
}

export default BrowserApp
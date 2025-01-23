import './style.css'

import PeriodicTableApp from './app/PeriodicTableApp'
import Icon from './widgets/icon'
import BrowserApp from './app/BrowserApp'
import Snake from './app/Snake'

new Icon("Tabela Periódica", "icon_periodic_table.svg", () => {
	const a = new PeriodicTableApp()
	a.Start()
})

new Icon("Navegador", "icon_search.svg", () => {
	const a = new BrowserApp()
	a.Start()
})

new Icon("SNaK", "icon_snake.svg", () => {
	const a = new Snake()
	a.Start()
})
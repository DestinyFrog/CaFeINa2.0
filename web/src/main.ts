import './style.css'

import PeriodicTableApp from './app/PeriodicTableApp'
import Icon from './widgets/icon'
import BrowserApp from './app/BrowserApp'

new Icon("Tabela Periódica", "icon_periodic_table.svg", () => {
	const a = new PeriodicTableApp()
	a.Start()
})

new Icon("Navegador", "icon_search.svg", () => {
	const a = new BrowserApp()
	a.Start()
})

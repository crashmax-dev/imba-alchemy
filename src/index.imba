import { Board } from './board'
import { Counter } from './counter'
import { Storage } from './storage'
import elements from './elements.json'

global css body
	bg:black
	ff:sans
	of:hidden

tag App
	prop storage = new Storage

	def render
		<self[pos:relative]>
			const settings = storage.settings
			const elementsId = storage.elements
			<Counter current=elementsId.length max=elements.length>
			<Board
				elementsId=elementsId
				elements=elements
				settings=settings
			>

imba.mount <App>

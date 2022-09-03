import { Board } from './board'
import { Counter } from './counter'
import { Storage } from './storage'
import elements from './elements.json'
import type { IElement, ISettings } from './types'

global css body
	bg:black
	ff:sans
	of:hidden

tag App
	prop storage = new Storage
	prop settings\ISettings = storage.settings
	prop elementsId\number[] = storage.elements

	css
		pos:relative

	def render
		<self>
			<Counter
				current=elementsId.length
				max=elements.length
			>
			<Board
				elementsId=elementsId
				elements=elements
				settings=settings
			>

imba.mount <App>

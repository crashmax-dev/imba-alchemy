import { Storage } from './storage'
import { Element } from './element'
import type { IElement } from './types'

global css body
	bg:black
	ff:sans
	of:hidden

tag App
	prop storage = new Storage
	prop allElements\IElement[]

	def mount
		const response = await window.fetch('/elements.json')
		allElements = await response.json!

	def getRects(name\string)
		const rects = Object.values(this.children).map(do(el)
			{
				rects: el.children[0].getBoundingClientRect!
				name: el.getAttribute('name')
			}
		)

		console.log name, rects

	def render
		<self[pos:relative]>
			if storage && allElements
				const elements = storage.getItem(storage.keys.elements)
				const settings = storage.getItem(storage.keys.settings)
				<span[c:white pos:absolute r:0 z:999 fs:10]> "{elements.length}/{allElements.length}"
				for element of elements
					const el = allElements[element - 1]
					<Element
						name=el.class
						displayName=el.text
						size=settings.size
						@mouseup=getRects(el.class)
					>

imba.mount <App>

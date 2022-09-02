import { Storage } from './storage'
import { Element } from './element'
import type { IElement } from './types'

global css body
	bg:black
	ff:sans
	of:hidden

tag App
	prop storage = new Storage
	prop elements\IElement[]

	def mount
		const response = await window.fetch('/elements.json')
		elements = await response.json!

	def getRects(name\string)
		const rects = Object.values(this.children).map(do(el)
			{
				rects: el.getBoundingClientRect!
				name: el.getAttribute('name')
			}
		)

		console.log rects

	def render
		<self[pos:relative]>
			if storage && elements
				for id of storage.getStorage!
					const el = elements[id - 1]
					<Element
						name=el.class
						displayName=el.text
						@mouseup=getRects(el.class)
					>

imba.mount <App>

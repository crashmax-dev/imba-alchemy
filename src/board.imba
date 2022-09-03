import { Element } from './element'
import type { IElement, ISettings } from './types'

export tag Board
	prop settings\ISettings
	prop elements\IElement[]
	prop elementsId\number[]

	def getRects(name\string)
		const rects = Object.values(this.children).map(do(el)
			{
				rects: el.children[0].getBoundingClientRect!
				name: el.getAttribute('name')
			}
		)
		console.log name, rects

	def render
		<self>
			for id of elementsId
				const el = elements[id - 1]
				<Element
					name=el.class
					displayName=el.text
					size=80
					size=settings.size
					@mouseup=getRects(el.class)
				>

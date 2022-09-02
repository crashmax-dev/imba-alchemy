import { randomPosition } from './helpers'
import { isDev } from './constants'

export tag Element
	attr name\string
	attr displayName\string

	css .element
		us:none
		pos:absolute
		touch-action:manipulation

	css .image
		w:80px
		h:80px

	css .title
		c:white
		ta:center
		pt:10px

	def build
		const { x, y } = randomPosition!
		x = x
		y = y

	def render
		<self[x:{x} y:{y}] @touch.moved.sync(self)>
			<div.element[bd:{isDev ? 'dashed' : 'none'} bc:red]>
				<img.image src="/images/{name}.webp" draggable=false>
				<div.title> "{displayName}"

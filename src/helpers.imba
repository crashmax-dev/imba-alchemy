import { innerWidth, innerHeigth } from './constants'

export def random(max\number)
	Math.floor(Math.random! * max + 1)

export def randomPosition
	const x = random(innerWidth)
	const y = random(innerHeigth)
	return { x, y }

export def checkCollision(el1\HTMLElement, el2\HTMLElement)
	console.log el1, el2

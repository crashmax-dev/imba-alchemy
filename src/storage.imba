export class Storage
	prop keys = {
		settings: 'settings'
		elements: 'elements'
	}

	constructor
		this.initialStore!

	get elements
		this.getItem(this.keys.elements)

	get settings
		this.getItem(this.keys.settings)

	def initialStore
		let settings = this.getItem(this.keys.settings)
		let elements = this.getItem(this.keys.elements)

		if !settings
			const initialSettings = {
				size: 80,
				sound: true
			}
			this.setItem(this.keys.settings, initialSettings)
			settings = initialSettings

		if !elements
			const initialElements = [1, 2, 3, 4]
			this.setItem(this.keys.elements, initialElements)
			elements = initialElements

	def getItem(key\string)
		try
			JSON.parse(window.localStorage.getItem(key))
		catch err
			console.error err

	def setItem(key\string, value\unknown)
		window.localStorage.setItem(key, JSON.stringify(value))

	def removeItem(key\string)
		window.localStorage.removeItem(key)

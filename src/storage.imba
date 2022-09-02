export class Storage
	prop storageKey = "elements"
	prop initialStorage = [1, 2, 3, 4]

	def getStorage
		try
			const storage = JSON.parse(window.localStorage.getItem(this.storageKey))
			if storage
				return storage
			else
				window.localStorage.setItem(this.storageKey, JSON.stringify(this.initialStorage))
				return this.initialStorage

		catch err
			console.error err

	def writeStorage(elements\number[])
		window.localStorage.setItem(this.storageKey, JSON.stringify(elements))

	def cleanStorage
		window.localStorage.removeItem(this.storageKey)

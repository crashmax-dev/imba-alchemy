export tag Counter
	attr max\number
	attr current\number

	css .counter
		c:white
		pos:absolute
		r:0
		z:999
		fs:10

	def render
		<self>
			<span.counter> "{current}/{max}"

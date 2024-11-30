extends Label


func _input(event):
	if event is InputEventScreenDrag:
		# Get the relative movement of the drag
		var relative = event.relative
		
		# Get the position of the drag
		var position = event.position
		
		# Get the speed of the drag
		var speed = event.velocity
		
		# Print the values for debugging
		#print("Drag relative movement: ", relative)
		#print("Drag position: ", position)
		#print("Drag speed: ", speed)
		
		# Example: Move a node based on the drag
		position += relative
		
		text = 'position_x: ' + str(position.x) + '\rrelative: ' + str(int(relative.x))

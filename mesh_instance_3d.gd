extends MeshInstance3D

# The point of this script is that when we swipe across the 
# subviewport, the 3d model will spin. InputEventScreenDrag is the hero

var rotation_speed = 0.0
var rotation_decay = 1.5    # Lower value means it spins longer
var sensitivity = 0.005     # Lower for smoother rotation
var max_speed = 10.0         # Maximum rotation speed

func _input(event):
	if event is InputEventScreenDrag:
		# Add to the current rotation speed instead of setting it
		rotation_speed += event.velocity.x * sensitivity
		# Clamp the maximum speed
		rotation_speed = clamp(rotation_speed, -max_speed, max_speed)

func _process(delta):
	# Apply the rotation
	rotate_y(rotation_speed * delta)
	
	# Apply exponential decay to the rotation speed
	rotation_speed *= (1.0 - delta * rotation_decay)
	
	# Stop rotating if speed is very low
	if abs(rotation_speed) < 0.01:
		rotation_speed = 0.0

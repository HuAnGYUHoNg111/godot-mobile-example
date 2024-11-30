extends Sprite2D

@export var speed : float = 100

@export var joystick_left : VirtualJoystick

@export var joystick_right : VirtualJoystick

var move_vector := Vector2.ZERO

func _process(delta: float) -> void:
	## Movement using the joystick output:
#	if joystick_left and joystick_left.is_pressed:
#		position += joystick_left.output * speed * delta
	
	## Movement using Input functions:
	move_vector = Vector2.ZERO
	
	# get_vector handles deadzone with the last parameter. Since we are handling it with
	# the virtual joystick, we don't need this extra deadzone calculation logic (set to 0)
	move_vector = Input.get_vector("ui_left","ui_right","ui_up","ui_down", 0)
	position += move_vector * speed * delta
	
	# Rotation:
	if joystick_right and joystick_right.is_pressed:
		rotation = joystick_right.output.angle()

extends Control

@onready var full_screen_button: TouchScreenButton = $TopRightAnchor/FullScreenButton

# label display to show UI feedback
@onready var joystick_display: Label = $Labels/JoystickDisplay
@onready var a_pressed_label: Label = $BottomRightAnchor/APressedLabel
@onready var b_pressed_label: Label = $BottomRightAnchor/BPressedLabel
@onready var c_pressed_label: Label = $BottomRightAnchor/CPressedLabel


func _ready() -> void:
	full_screen_button.released.connect(_full_screen_toggled)


func _full_screen_toggled() -> void:
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)	
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func _process(_delta: float) -> void:
	
	# joystick automatically feeds into this
	# without any extra work.
	# get_vector handles deadzone with the last parameter. Since we are handling it with
	# the virtual joystick, we don't this extra deadzone calculation logic
	var move_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down", 0)
	joystick_display.text = 'Joystick: ' + str( move_vector )
	
	a_pressed_label.visible = Input.is_action_pressed("custom_action_1") 
	b_pressed_label.visible = Input.is_action_pressed("custom_action_2") 
	c_pressed_label.visible = Input.is_action_pressed("custom_action_3")

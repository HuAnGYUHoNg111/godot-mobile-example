extends Node3D


# buttons to put on the UI that can be clicked
@onready var button_a: Button = $ButtonA
@onready var button_b: Button = $ButtonB
@onready var button_c: Button = $ButtonC

@onready var button_full_screen: Button = $ButtonFullScreen



# label display to show UI feedback
@onready var joystick_display: Label = $Labels/JoystickDisplay
@onready var a_pressed_label: Label = $Labels/APressedLabel
@onready var b_pressed_label: Label = $Labels/BPressedLabel
@onready var c_pressed_label: Label = $Labels/CPressedLabel

func _ready() -> void:
	button_full_screen.toggled.connect(_full_screen_toggled)
	
	
func _full_screen_toggled(is_full_screen: bool) -> void:
	
	if is_full_screen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)		

func _process(_delta: float) -> void:
	
	# joystick automatically feeds into this
	# without any extra work.
	# get_vector handles deadzone with the last parameter. Since we are handling it with
	# the virtual joystick, we don't this extra deadzone calculation logic
	var move_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down", 0)
	joystick_display.text = 'Joystick: ' + str( move_vector )
	
	a_pressed_label.visible = button_a.is_pressed() || Input.is_action_pressed("custom_action_1") 
	b_pressed_label.visible = button_b.is_pressed() || Input.is_action_pressed("custom_action_2") 
	c_pressed_label.visible = button_c.is_pressed() || Input.is_action_pressed("custom_action_3")

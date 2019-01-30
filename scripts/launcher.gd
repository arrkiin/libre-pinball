# Copyright (c) 2015 Calinou - MIT license
# See LICENSE.md for more information.

extends KinematicBody2D

# Save positions of launcher for later use:
var pos_x
var pos_y

# Variable to make the sound play only once per key press:
var sound_to_play = true

# Y position offset of launcher:
var push = 0

func _ready():
	set_process_input(true)
	set_physics_process(true)

	pos_x = get_position().x
	pos_y = get_position().y

func _physics_process(delta):
	# Cap Y offset values:
	if push >= 4:
		push = 4
	if push <= -4:
		push = -4

	if Input.is_action_pressed("use_launcher"):
		push += 4
		set_position(Vector2(pos_x, pos_y - push))
		if sound_to_play:
			$SamplePlayer.play()
		sound_to_play = false
	else:
		push -= 4
		set_position(Vector2(pos_x, pos_y - push))
		sound_to_play = true


# Copyright (c) 2015 Calinou - MIT license
# See LICENSE.md for more information.

extends KinematicBody2D

# Variable to make the sound play only once per key press:
var sound_to_play = true

func _init():
	# Rotation of the paddle:
	rotation = 0.3

func _ready():
	set_physics_process(true)
	set_process_input(true)

func _physics_process(delta):
	# Cap rotation values:
	if rotation >= 0.3:
		rotation = 0.3

	if rotation <= -0.3:
		rotation = -0.3

	# When `paddle_left` is pressed, start rotating and play sound once:
	if Input.is_action_pressed("paddle_left"):
		rotation -= 0.06
		if sound_to_play:
			$SamplePlayer.play()
			sound_to_play = false
	else:
		rotation += 0.06
		sound_to_play = true

	set_rotation(rotation)


# Copyright (c) 2015 Calinou - MIT license
# See LICENSE.md for more information.

extends Control

var show_fps = false

func _ready():
	set_process_input(true)
	set_physics_process(true)

#warning-ignore:unused_argument
func _physics_process(delta):
	var fps = Performance.get_monitor(Performance.TIME_FPS)
	if show_fps:
		# Show FPS counter:
		$"Frames per Second".set_text(str(fps) + " FPS")
	else:
		# Show nothing:
		$"Frames per Second".set_text("")

	$Score.set_text(str(Global.score))
	$Lives.set_text(str(Global.lives))

#warning-ignore:unused_argument
func _input(event):
	if Input.is_action_pressed("toggle_fps_display") and not show_fps:
		show_fps = true
	elif Input.is_action_pressed("toggle_fps_display") and show_fps:
		show_fps = false


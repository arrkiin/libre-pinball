# Copyright (c) 2015 Calinou - MIT license
# See LICENSE.md for more information.

extends Control

var paused = false

func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("pause") and not paused:
		Global.pause()
		paused = true
	elif event.is_action_pressed("pause") and paused:
		Global.resume()
		paused = false

func _on_Resume_Button_pressed():
	Global.resume()

func _on_Quit_Button_pressed():
	Global.quit()

func _on_Restart_Button_pressed():
	Global.restart()

func _on_Main_Menu_Button_pressed():
	Global.go_to_main_menu()


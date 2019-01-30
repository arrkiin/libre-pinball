# Copyright (c) 2015 Calinou - MIT license
# See LICENSE.md for more information.

extends Control

func _ready():
	print(tr("main_menu_loaded"))
	Global.table_window_title("Main Menu")

func _on_Play_Button_pressed():
	#warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/table_1.tscn")
	
	# TODO: Level selection, several tables

func _on_Quit_Button_pressed():
	Global.quit()


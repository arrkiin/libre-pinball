# Copyright (c) 2015 Calinou - MIT license
# See LICENSE.md for more information.

extends Node2D

#warning-ignore:unused_class_variable
onready var ball = $Ball.body
var table_name = "Test"

func _ready():
	print(tr("table_loaded").replace("%s", table_name))
	Global.table_window_title("Test")

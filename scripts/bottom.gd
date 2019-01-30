# Copyright (c) 2015 Calinou - MIT license
# See LICENSE.md for more information.

extends Node2D

onready var global = $"/root/Global"
var hud

var timer = 0
#warning-ignore:unused_class_variable
var pos_x
#warning-ignore:unused_class_variable
var pos_y

func _ready():
	set_physics_process(true)

#warning-ignore:unused_argument
func _physics_process(delta):
	# Prevent the ball from being reset while the game is started:
	timer += 1

	if timer >= 10:
		timer = 10

#warning-ignore:unused_argument
func _on_Bottom_Area_body_enter(area):
	var ball = get_parent().ball
	global.lives -= 1
	# "Life lost" sound:
	$AudioStreamPlayer.play()

	# The player still has lives:
	if timer >= 10 and global.lives > 0:
		# Reset ball position and velocity:
		ball.reset = true
		print(tr("life_lost") + " " + str(global.lives))

	# The player has no lives anymore, show the Game Over screen:
	elif timer >= 10:
		hud = $"../HUD/Game Over"
		hud.show()
		print(tr("game_over"))


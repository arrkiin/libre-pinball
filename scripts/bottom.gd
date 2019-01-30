# Copyright (c) 2015 Calinou - MIT license
# See LICENSE.md for more information.

extends Node2D

var global
var ball
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
	global = get_node("/root/Global")
	ball = get_node("../Ball/RigidBody2D")

	global.lives -= 1
	# "Life lost" sound:
	$AudioStreamPlayer.play()

	# The player still has lives:
	if timer >= 10 and global.lives > 0:
		# Reset ball position and velocity:
		ball.set_global_position(Vector2(338, 530)) # Ball position on Table 1
		ball.set_linear_velocity(Vector2(0, 0))
		ball.set_angular_velocity(0)
		print(tr("life_lost") + " " + str(global.lives))

	# The player has no lives anymore, show the Game Over screen:
	elif timer >= 10:
		hud = get_node("../HUD/Game Over")
		hud.show()
		print(tr("game_over"))


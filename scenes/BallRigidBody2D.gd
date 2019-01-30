extends RigidBody2D

var reset = false

func _integrate_forces(state : Physics2DDirectBodyState):
	if reset:
		state.angular_velocity = 0
		state.linear_velocity = Vector2(0,0)
		state.transform = Transform2D(0,get_parent().to_global(Vector2(0,0)))
		reset = false
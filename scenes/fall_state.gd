extends state

@export
var walk_state: state


func physics(delta):
	super(delta)
	#down arrow decel + gravity
	if parent.velocity.y < parent.top_speed_descent:
		parent.velocity.y += parent.gravity * delta * (0.8 if parent.velocity.y > 0 else 1)
	if parent.velocity.y < 0 and Input.is_action_just_released('jump'):
		parent.velocity.y *= 0.8
	
	#horizontal movement
	if Input.get_axis("move_left","move_right") != 0:
		parent.velocity.x = Input.get_axis("move_left","move_right") * parent.move_speed
	else:
		parent.velocity.x /= parent.decel_rate
	
	if parent.is_on_floor():
		exit(walk_state)

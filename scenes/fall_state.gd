extends state

@export
var walk_state: state

@export
var gravity: int = 100

func run(delta):
	super(delta)
	#down arrow decel + gravity
	parent.velocity.y += gravity * delta * ( 1 + Input.get_action_strength("move_down"))
	
	#horizontal movement
	if Input.get_axis("move_left","move_right") != 0:
		parent.velocity.x = Input.get_axis("move_left","move_right") * parent.move_speed
	else:
		parent.velocity.x /= parent.decel_rate
	
	if parent.is_on_floor():
		exit(walk_state)

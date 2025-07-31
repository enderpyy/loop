extends state

@export
var idle_state: state
@export
var walk_state: state
@export
var fall_state: state

@export
var jump_force = 200
@export
var gravity: int = 100

@export
var move_speed: int
@export
var decel_rate: float



func init():
	super()
	print("jumped")
	parent.velocity.y -= jump_force
	print(parent.velocity)

func run(delta):
	super(delta)
	#down arrow decel + gravity
	parent.velocity.y += gravity * delta * ( 1 + Input.get_action_strength("move_down"))
	
	#spacebar release decel
	if Input.is_action_just_released("jump"):
		parent.velocity /= 2
	
	#horizontal movement
	if Input.get_axis("move_left","move_right") != 0:
		parent.velocity.x = Input.get_axis("move_left","move_right") * parent.move_speed
	else:
		parent.velocity.x /= parent.decel_rate
	
	if parent.velocity.y > 0:
		exit(fall_state)

func input(event):
	super(event)

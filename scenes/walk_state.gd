extends state

@export
var idle_state: state
@export
var jump_state: state




func init():
	print("walking")
	super()

func run(delta):
	print('running')
	if Input.is_action_just_pressed("jump"):
		exit(jump_state)
	if Input.get_axis("move_left","move_right") != 0:
		parent.velocity.x = Input.get_axis("move_left","move_right") * parent.move_speed
	else:
		parent.velocity.x /= parent.decel_rate
	if abs(parent.velocity.x) <= parent.move_speed / 100:
		exit(idle_state)
	

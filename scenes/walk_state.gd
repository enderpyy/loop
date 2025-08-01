extends state

@export
var idle_state: state
@export
var fall_state: state
@export
var crouch_state:state



func init():
	#print("walking")
	super()

func run(delta):
	#print('running')
	if not parent.is_on_floor():
		exit(fall_state)
		return
	if Input.is_action_just_pressed("jump"):
		parent.velocity.y = -parent.jump_velocity
		exit(fall_state)
		return
	if Input.get_axis("move_left","move_right") != 0:
		parent.velocity.x = Input.get_axis("move_left","move_right") * parent.move_speed
	else:
		parent.velocity.x /= parent.decel_rate
	if abs(parent.velocity.x) <= parent.move_speed / 100:
		exit(idle_state)
func input(event):
	if Input.is_action_just_pressed("move_down"):
		exit(crouch_state)

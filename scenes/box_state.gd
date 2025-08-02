extends state

@export
var crouch_state: state
@export
var jump_state: state

func init():
	super()
	parent.box()

func physics(delta):
	parent.velocity.x /= parent.decel_rate

func input(event):
	if Input.is_action_just_pressed("up"):
		exit(crouch_state)
	elif Input.is_action_just_pressed("jump"):
		exit(jump_state)

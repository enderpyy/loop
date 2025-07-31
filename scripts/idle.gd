extends state

@export
var walk_state: state
@export
var fall_state: state

func init():
	super()
	parent.velocity = Vector2(0,0)

func run(delta):
	pass

func input(event):
	super(event)
	if Input.is_action_just_pressed("jump"):
		parent.velocity.y = -parent.jump_velocity
		exit(fall_state)
		return
	elif Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		exit(walk_state)
	
	if !parent.is_on_floor():
		exit(fall_state)
		

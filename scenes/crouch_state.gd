extends state

@export var idle_state: state
@export var box_state: state

@export
var decel_factor: int = 1.2

func init():
	#start timer
	super()

func physics(delta):
	if Input.get_axis("move_left","move_right") != 0:
		parent.velocity.x = Input.get_axis("move_left","move_right") * parent.move_speed/decel_factor

func input(event):
	#if timer
	
	if Input.is_action_just_pressed('move_down'):
		exit(box_state)
	if Input.is_action_just_pressed("move_up"):
		exit(idle_state)

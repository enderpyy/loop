extends state

@export
var idle_state: state

func init():
	super()
	

func physics(delta):
	if len(parent.past_frames) == 0:
		exit(idle_state)
	parent.position = parent.past_positions.pop_back()
	parent.sprite.frame = parent.past_frames.pop_back()

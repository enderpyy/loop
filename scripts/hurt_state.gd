extends state

@export
var rewind_state: state

func init():
	super()
	parent.velocity = Vector2.ZERO
	parent.rotation = PI
	#if parent.can_rewind:
		#exit(rewind_state)
	#else:
		##die
		#pass

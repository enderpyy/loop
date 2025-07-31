extends state

@export
var rewind_state: state

func init():
	super()
	if parent.can_rewind:
		exit(rewind_state)
	else:
		#die
		pass

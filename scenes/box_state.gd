extends state


func init():
	super()
	print("boxed")
	parent.animator.play("box")

func physics(delta):
	parent.velocity.x /= parent.decel_rate

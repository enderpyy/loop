extends state


func init():
	super()
	print("boxed")
	parent.animator.play("box")

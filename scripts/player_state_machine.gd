extends Node

@onready var parent = self.get_parent()

func init():
	for state in get_children():
		state.parent = parent
	parent.current_state.init()

func _input(event: InputEvent) -> void:
	parent.current_state.input(event)

func _process(delta: float) -> void:
	parent.current_state.run(delta)

func _physics_process(delta: float) -> void:
	parent.current_state.physics(delta)

func switch_state(new_state):
	parent.current_state = new_state
	parent.current_state.init()

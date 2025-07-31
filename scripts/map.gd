extends Node2D

@export
var width: int = 49
@export
var height: int = 27

func _ready() -> void:
	for i in range(width):
		pass

var levels = []

func change_level():
	get_child(0).position = Vector2(0, 0)
	get_child(1).queue_free()
	

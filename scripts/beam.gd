extends Area2D

@onready
var laser = $laser_beam

@export
var min_rot := 90
@export
var max_rot := 90

func _ready() -> void:
	self.rotation_degrees = 90
	
	
var t = 0.0
func _process(delta: float) -> void:
	t += delta
	self.rotation_degrees = 90 + 15*sin(t)
	global_vars.counter = 0

extends Area2D

@onready
var laser = $laser_beam

@export
var rot_pivot := 90
@export
var amp := 2.0
@export
var freq := 1.0

func _ready() -> void:
	self.rotation_degrees = 90
	
	
var t = 0.0
func _process(delta: float) -> void:
	t += delta
	self.rotation_degrees = rot_pivot + amp*sin(freq*t)
	global_vars.counter = 0

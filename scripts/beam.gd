extends Area2D

@onready
var laser = $laser_beam

@export
var min_rot := 90
@export
var max_rot := 90

func _ready() -> void:
	self.rotation = deg_to_rad(min_rot)
	laser.is_casting = true
	
	

func _physics_process(delta: float) -> void:
	pass

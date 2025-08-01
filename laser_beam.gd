extends RayCast2D

@export var max_length := 1400
@export var single_frame = false

@onready var line = $line
@onready var laser = preload("res://scenes/laser_beam.tscn")

var delete_this_frame = false
func _ready():
	self.visible = false

func _process(delta: float) -> void:
	self.visible = true
	if delete_this_frame:
		self.visible = false
		queue_free()
		return
	elif single_frame:
		delete_this_frame = true

	if not is_colliding():
		target_position.x = max_length
		line.points[1].x = max_length
	else:
		var laser_end_pos := get_collision_point()
		line.points[1].x = global_position.distance_to(laser_end_pos)
		
		var collider = get_collider()
		if collider.has_method("take_damage"):
			collider.take_damage()
		if collider is reflective:
			var normal = get_collision_normal()
			var V_in = Vector2.RIGHT.rotated(global_rotation)
			
			var reflect_vector = V_in.bounce(normal)
			#printt(V_in, normal, reflect_vector)
			var l = laser.instantiate()
			l.single_frame = true
			l.global_position = laser_end_pos + reflect_vector*1
			l.global_rotation = reflect_vector.angle()
			global_vars.global_instancing.add_child(l)

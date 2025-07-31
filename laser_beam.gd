extends RayCast2D

@export var cast_speed := 7000
@export var max_length := 1400

@onready var line = $line

var has_ray = false

func _physics_process(delta: float) -> void:
	target_position.x = move_toward(
		target_position.x,
		max_length,
		cast_speed * delta
	)
	
	for child in get_children():
		if child.get_class() == "RayCast2D":
			child.position = target_position
	
	var laser_end_pos := target_position
	force_raycast_update()
	if is_colliding():
		#print(get_collision_normal())
		var collider = get_collider()
		if collider.has_method("take_damage"):
			collider.take_damage()
		if collider.has_method("reflect"):
			if !has_ray:
				has_ray = true
				pass
		else:
			if has_ray:
				#delete ray
				pass
			
			
			#reflect logic
		laser_end_pos = to_local(get_collision_point())
	line.points[1] = laser_end_pos
@export var is_casting := false: set = set_is_casting

func set_is_casting(new_value: bool) -> void:
	if is_casting == new_value:
		return
	is_casting = new_value
	set_physics_process(is_casting)
	if is_casting == false:
		target_position.x = 0

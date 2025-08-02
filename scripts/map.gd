extends Node2D

@export
var width: int = 49
@export
var height: int = 27

var levels_dir = 'res://scenes/levels/'
var levels = ResourceLoader.list_directory(levels_dir)

@export var start_at_level := 0
var current_level = start_at_level

func _ready() -> void:
	print(levels)
	global_vars.global_instancing = $global_instancing
	Engine.max_fps = 60
	signal_bus.booty_grabbed.connect(change_level)
	change_level()



func change_level():
	print(current_level)
	await get_tree().create_timer(1).timeout
	get_child(1).position = Vector2(28, 399)
	get_child(2).queue_free()
	if current_level >= len(levels):
		return
	var n = load(levels_dir + levels[current_level])
	var b = n.instantiate()
	add_child(b)
	current_level += 1
	
	

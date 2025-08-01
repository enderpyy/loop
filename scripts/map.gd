extends Node2D

@export
var width: int = 49
@export
var height: int = 27

func _ready() -> void:
	Engine.max_fps = 60
	signal_bus.booty_grabbed.connect(change_level)
	
	for i in range(width):
		pass

var level_uids = ['uid://bwjn2t0flkaxn', 'uid://bq0dtmdbmhucb']
var current_level = 0

func change_level():
	current_level += 1
	get_child(0).position = Vector2(28, 399)
	get_child(1).queue_free()
	if current_level >= len(level_uids):
		return
	var n = load(level_uids[current_level])
	var b = n.instantiate()
	add_child(b)
	

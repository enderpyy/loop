extends Area2D


var used = false
@export var id := 0
func _on_body_entered(body: Node2D) -> void:
	if not used and body is player:
		print('id, ', id)
		signal_bus.booty_grabbed.emit()
		used = true

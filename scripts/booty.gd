extends Area2D


func let_em_know_this_booty_taken():
	signal_bus.booty_grabbed.emit()


func _on_body_entered(body: Node2D) -> void:
	if body is player:
		let_em_know_this_booty_taken()

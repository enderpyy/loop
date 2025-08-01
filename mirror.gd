@tool
class_name reflective
extends RigidBody2D
@export var width = 30

func _ready():
	var m = SegmentShape2D.new()
	m.a.x = -width/2
	m.a.y = 0
	m.b.x = width/2
	m.b.y = 0
	$"mirror collision".shape = m
	$Line2D.points = PackedVector2Array([Vector2(-width/2, 0), Vector2(width/2, 0)])

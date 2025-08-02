class_name player
extends CharacterBody2D


#node refs
@onready
var state_machine = $player_state_machine
@onready
var sprite = $player_sprite
@onready
var animator = $player_sprite/player_animator
@onready
var player_collision = $player_collision
@onready
var box_collision = $box_collision

#state machine exports
@export
var current_state: state
@export
var hurt_state: state
@export
var rewind_state: state

# SET MOVE SPEED
const move_speed: int = 100
const decel_rate: float = 1.5

#unused as of now
@export
var health: int = 3

# SET JUMP HEIGHT AND TIME
const jump_height := 45 # in pixels
const jump_time := 0.7 # in seconds
const top_speed_descent := 250 # in pixels/second

# GRAVITY & VELOCITY CALCULATED
var gravity := 2 * jump_height / pow(jump_time/2, 2)
var jump_velocity := gravity * (jump_time/2)



func _input(e):
	if Input.is_action_just_pressed("click"):
		pass


func _ready():
	sprite.frame = 1
	
	#initialize state machine
	state_machine.init()
	
	#set up take damage command. damage is handled by damagers
	signal_bus.connect("damage_player", take_damage)

var can_rewind = true
var past_positions = []
var past_frames = []

func _physics_process(delta: float) -> void:
	move_and_slide()
	#physics process updates 60 times per second
	if can_rewind:
		
		past_positions.append(position)
		
		past_frames.append(sprite.frame)
		if len(past_positions) > 300:
			#past_positions = []
		#	past_frames = []
			can_rewind = false


func start_rewind():
	can_rewind = true
	#place marker

func set_health(health):
	pass

func take_damage():
	print("ow")
	if current_state == hurt_state or current_state == rewind_state:
		return
	state_machine.switch_state(hurt_state)

#box state
func box():
	animator.play("box")
	player_collision.disabled = true
	box_collision.disabled = false

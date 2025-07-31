extends CharacterBody2D

#node refs
@onready
var state_machine = $player_state_machine
@onready
var sprite = $player_sprite

#state machine exports
@export
var current_state: state
@export
var hurt_state: state
@export
var rewind_state: state

#standard move speeds
@export
var move_speed: int = 100
@export
var decel_rate: float = 1.1

#unused as of now
@export
var health: int = 3

func _ready():
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
	if current_state == hurt_state or current_state == rewind_state:
		return
	state_machine.switch_state(hurt_state)

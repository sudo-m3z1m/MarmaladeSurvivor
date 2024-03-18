extends Node2D

@onready var first_checkpoint: Marker2D
@onready var player: Node2D = $Player
@onready var death_area: Area2D = $DeathArea
@onready var label: Label = $Label

var current_checkpoint: Marker2D
var time: float

func _ready() -> void:
	player.get_node("PlayebleSegment").apply_central_force(Vector2.DOWN * 1000000)
	death_area.body_entered.connect(return_player_to_checkpoint)

func _process(delta) -> void:
	time += delta

func set_current_checkpoint(checkpoint: Marker2D) -> void:
	current_checkpoint = checkpoint

func return_player_to_checkpoint(body: Node2D) -> void:
	if !(body is MarmeladeSegment):
		return
	body.global_position = current_checkpoint.global_position

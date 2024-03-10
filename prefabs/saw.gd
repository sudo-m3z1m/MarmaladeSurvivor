extends Node2D

@export var recoil_force_amount: float

@onready var hit_area: Area2D = $HitArea
@onready var saw_sprite: Sprite2D = $Sprite2D
@onready var audio_player: AudioStreamPlayer2D = $AudioStreamPlayer

func _ready() -> void:
	hit_area.body_entered.connect(_on_player_colided)

func _process(delta):
	saw_sprite.rotation = lerp(saw_sprite.rotation, saw_sprite.rotation + PI/2, 0.2)

func _on_player_colided(body: Node2D) -> void:
	var direction_to_body: Vector2
	if body is MarmeladeSegment:
		direction_to_body = global_position.direction_to(body.global_position)
		body.apply_central_force(direction_to_body * recoil_force_amount)


func _on_audio_stream_player_2d_finished() -> void:
	audio_player.play()

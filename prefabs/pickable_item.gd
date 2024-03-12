extends Node2D

@onready var area: Area2D = $Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	area.body_entered.connect(player_entered)

func player_entered(target: Node2D) -> void:
	if target is Player:
		activate(target)

func activate(target: Player) -> void:
	pass

extends Node2D

@onready var checkpoint: AnimatedSprite2D = $checkpoint

@export var next_level_path: String

func _on_area_2d_body_entered(body: Node2D) -> void:
	global.next_level(next_level_path)

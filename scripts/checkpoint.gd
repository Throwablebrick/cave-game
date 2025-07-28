extends Node2D

@onready var checkpoint: AnimatedSprite2D = $checkpoint

@export var next_level_path: String = "res://scenes/"

func _ready() -> void:
	checkpoint.play("default")
func _on_area_2d_body_entered(_body: Node2D) -> void:
	global.next_level(next_level_path)

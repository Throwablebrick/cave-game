extends MarginContainer

@onready var sprite: AnimatedSprite2D = $sprite

@export var number: int

var frame = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global.update_ui.connect(_update_ui)

func _update_ui(health: int):
	if floor((11-health)/4) == number:
		frame += 1
		sprite.frame = frame

extends MarginContainer

@onready var sprite: AnimatedSprite2D = $sprite

@export var number: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global.update_ui.connect(_update_ui)

func _update_ui(health: int):
	if floor((11-health)/4) == number:
		sprite.frame = ((11-health) % 4) + 1
	if health > 12:
		sprite.frame = 0
		global.hearts_updated += 1
		if global.hearts_updated == 3:
			global.player_health = 12
			global.hearts_updated = 0

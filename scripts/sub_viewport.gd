extends SubViewport

@onready var level = get_node("Node2D")
var current_level = "res://scenes/test"

func _ready() -> void:
	global.switch_level.connect(_switch_levels)

func _switch_levels(lvl = "trash"):
	remove_child(level)
	level.call_deferred("free")
	var new_level
	if lvl == "trash":
		new_level = current_level
	
	var next_level = load(new_level).instantiate()
	add_child(next_level)
	global.player_health = 12
	current_level= new_level

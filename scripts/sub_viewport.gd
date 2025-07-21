extends SubViewport

@onready var level = get_node("Node2D")

func _ready() -> void:
	global.switch_level.connect(_switch_levels)

func _switch_levels(new_level):
	remove_child(level)
	level.call_deferred("free")
	
	var next_level = load(new_level).instantiate()
	add_child(next_level)

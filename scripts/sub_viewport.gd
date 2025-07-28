extends SubViewport

@onready var level = get_node("Node2D")
var current_level = "res://scenes/test.tscn"
@onready var music_start: AudioStreamPlayer2D = $"../../music_start"
@onready var main_music: AudioStreamPlayer2D = $"../../main_music"

func _ready() -> void:
	global.switch_level.connect(_switch_levels)
	music_start.play()

func _switch_levels(lvl = "trash"):
	global.player_health = 13
	global.ui_update()
	remove_child(level)
	level.call_deferred("free")
	var new_level
	if lvl == "trash":
		new_level = current_level
	else:
		new_level = lvl
	
	var next_level = load(new_level).instantiate()
	add_child(next_level)
	current_level= new_level
	level = get_node("Node2D")


func _on_music_start_finished() -> void:
	main_music.play()


func _on_main_music_finished() -> void:
	main_music.play()

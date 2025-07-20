extends Node

signal toggle_main_menu
signal update_ui

var player_health = 12
var running = false
var run_once = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func ui_update():
	update_ui.emit(player_health)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if run_once:
		toggle_main_menu.emit()
		run_once = false

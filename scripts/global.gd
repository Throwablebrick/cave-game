extends Node


signal toggle_main_menu
signal update_ui
signal died
signal switch_level

var player_health = 12
var running = true
var run_once = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
func death():
	died.emit()
func ui_update():
	update_ui.emit(player_health)
func next_level(path = "trash"):
	switch_level.emit(path)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if run_once:
		toggle_main_menu.emit()
		run_once = false

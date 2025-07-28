extends Control

@onready var pause: MarginContainer = $pause
@onready var main_menu: MarginContainer = $main_menu
@onready var hud: MarginContainer = $hud
@onready var pause_menu: VBoxContainer = $pause/ColorRect/pause_menu
@onready var volume_menu: VBoxContainer = $pause/ColorRect/volume_menu
@onready var death_menu: VBoxContainer = $pause/ColorRect/death_menu

func toggle_visible(thing: Object):
	if thing.visible:
		thing.visible = false
	else:
		thing.visible = true
func _ready() -> void:
	global.toggle_main_menu.connect(_toggle_main_menu)
	global.died.connect(_death_screen)
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui"):
		pause.visible = true
		pause_menu.visible = true
		global.running = false
func _toggle_volume() -> void:
	toggle_visible(pause_menu)
	toggle_visible(volume_menu)
func _return_to_game() -> void:
	pause.visible = false
	global.running = true
func _on_quit_pressed() -> void:
	get_tree().quit()
func _on_start_pressed() -> void:
	global.running = true
	main_menu.visible = false
	hud.visible = true
func _go_to_main_menu() -> void:
	hud.visible = false
	main_menu.visible = true
	pause.visible = false
func _toggle_main_menu():
	toggle_visible(main_menu)
	toggle_visible(hud)
func _death_screen():
	pause.visible = true
	pause_menu.visible = false
	death_menu.visible = true
	global.running = false
func _on_try_again_pressed() -> void:
	global.player_health = 12
	global.ui_update()
	global.running = true
	pause.visible = false
	death_menu.visible = false
	global.next_level()

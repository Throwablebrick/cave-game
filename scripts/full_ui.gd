extends Control

@onready var pause: MarginContainer = $pause
@onready var main_menu: MarginContainer = $main_menu
@onready var hud: MarginContainer = $hud
@onready var pause_menu: VBoxContainer = $pause/ColorRect/pause_menu
@onready var volume_menu: VBoxContainer = $pause/ColorRect/volume_menu
@onready var death_menu: VBoxContainer = $pause/ColorRect/death_menu

func _ready() -> void:
	global.toggle_main_menu.connect(_toggle_main_menu)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui"):
		toggle_visible(pause)
		global.running = false

func toggle_visible(object):
	if object.visible:
		object.visible = false
	else:
		object.visible = true


func _toggle_volume() -> void:
	toggle_visible(volume_menu)
	toggle_visible(pause_menu)


func _return_to_game() -> void:
	toggle_visible(pause)
	global.running = true


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_start_pressed() -> void:
	global.running = true
	toggle_visible(main_menu)
	toggle_visible(hud)


func _go_to_main_menu() -> void:
	toggle_visible(hud)
	toggle_visible(main_menu)
	toggle_visible(pause)

func _toggle_main_menu():
	toggle_visible(main_menu)

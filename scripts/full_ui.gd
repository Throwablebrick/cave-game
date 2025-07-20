extends Control

@export var pause_menu: VBoxContainer
@export var volume_menu: VBoxContainer

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui"):
		toggle_visible(pause_menu)

func toggle_visible(object):
	if object.visible:
		object.visible = false
	else:
		object.visible = true


func _toggle_volume() -> void:
	toggle_visible(volume_menu)

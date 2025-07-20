extends HSlider

@export var audio_bus_name := "Master"
@export var message: String

@onready var _bus := AudioServer.get_bus_index(audio_bus_name)
@onready var label: Label = $Label


func _ready() -> void:
	value = db_to_linear(AudioServer.get_bus_volume_db(_bus))
	label.text = message


func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(_bus, linear_to_db(value))

extends Node2D

@onready var node_2d: Node2D = $"."
@onready var collision_shape_2d: CollisionShape2D = $StaticBody2D/CollisionShape2D
@onready var sprite_2d: Sprite2D = $StaticBody2D/Sprite2D

@export var width: float
@export var height: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision_shape_2d.scale = Vector2(width, height)
	sprite_2d.scale = Vector2((width/16), (height/4))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

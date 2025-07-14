extends RigidBody2D

@onready var rigid_body_2d: CharacterBody2D = $"."
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var area_2d: Area2D = $Area2D
@onready var player_detector: CollisionShape2D = $Area2D/CollisionShape2D
@onready var timer: Timer = $Timer

const SPEED = 400
const JUMP_SPEED = -600

var found: bool
var destination: Vector2
var velocity: Vector2
var jump_ready: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if found:
		if jump_ready:
			jump_ready = false
			if rigid_body_2d.x>destination.x:
				velocity.x = -SPEED
			velocity.y = JUMP_SPEED


func _on_area_2d_body_entered(body: Node2D) -> void:
	found=true
	destination=body.position


func _on_timer_timeout() -> void:
	jump_ready=true

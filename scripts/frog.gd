extends CharacterBody2D

@onready var frog: CharacterBody2D = $"."
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

const SPEED = 400
const JUMP_SPEED = -600
const GRAVITY = 1500

var found: bool
var destination: Vector2
var jump_ready = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		velocity.x = 0
	if found:
		if jump_ready:
			jump_ready = false
			if frog.position.x>destination.x:
				velocity.x = -SPEED
			else:
				velocity.x = SPEED
			velocity.y = JUMP_SPEED
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	found=true
	destination=body.position
	print('guy entered at (%d, %d)' % [destination.x, destination.y])


func _on_timer_timeout() -> void:
	if is_on_floor():
		jump_ready=true
		print('jump ready (%d, %d)' % [destination.x, destination.y])

extends CharacterBody2D

@onready var node_2d: Node2D = $Node2D
@onready var legs: AnimatedSprite2D = $Node2D/legs
@onready var timer: Timer = $Timer

const GRAVITY = 1000
const JUMP_SMOOTH = 50
const ACCEL = 10
const DECCEL = 15
const SPEED = 200.0
const JUMP_VELOCITY = -320.0
const KNOCKBACKX = 200
const KNOCKBACKY = -100

var health = 8
var invul = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_released("up") and !is_on_floor():
		if velocity.y < -JUMP_SMOOTH:
			velocity.y = -JUMP_SMOOTH

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		if direction > 0:
			if velocity.x <= SPEED:
				if velocity.x < 0:
					velocity.x += DECCEL
				velocity.x += ACCEL * direction
		else:
			if velocity.x >= -SPEED:
				if velocity.x > 0:
					velocity.x += -DECCEL
				velocity.x += ACCEL * direction
	else:
		velocity.x = move_toward(velocity.x, 0, DECCEL)

	if velocity.x > 0:
		node_2d.scale.x = 1
		legs.play("walking")
	elif velocity.x < 0:
		legs.play("walking")
		node_2d.scale.x = -1
	else:
		legs.play("standing")

	move_and_slide()
	
func damage(amount: int, direction: int) -> void:
	health -= amount
	velocity = Vector2(KNOCKBACKX * direction, KNOCKBACKY)
	print(health)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if !invul:
		damage(body.power, 1 if body.position.x < position.x else -1)
		invul = true
		timer.start()


func _on_timer_timeout() -> void:
	invul = false

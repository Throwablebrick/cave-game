extends CharacterBody2D


const GRAVITY = 1500
const JUMP_SMOOTH = 100
const ACCEL = 10
const DECCEL = 15
const SPEED = 400.0
const JUMP_VELOCITY = -600.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_released("ui_accept") and !is_on_floor():
		if velocity.y < -JUMP_SMOOTH:
			velocity.y = -JUMP_SMOOTH

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
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

	move_and_slide()

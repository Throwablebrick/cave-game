extends CharacterBody2D

@onready var frog: CharacterBody2D = $"."
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var timer: Timer = $Timer

const SPEED = 150
const JUMP_SPEED = -200
const GRAVITY = 800
const KNOCKBACKX = 210
const KNOCKBACKY = -100
const power = 1

var found: bool
var destination: Vector2
var jump_ready = true
var target
var direction = 1
var health = 3
var hit = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if global.running:
		if not is_on_floor():
			velocity.y += GRAVITY * delta
			if !hit:
				velocity.x = SPEED * direction
		else:
			velocity.x = 0
			hit = false
		if found:
			destination=target.position
			if jump_ready:
				if frog.position.x>destination.x:
					direction = -1
				else:
					direction = 1
				jump_ready = false
				velocity.y = JUMP_SPEED
			
				
		move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	found=true
	target=body
	jump_ready = true
	timer.start()


func _on_timer_timeout() -> void:
	if is_on_floor():
		jump_ready=true
		timer.start()


func _on_area_2d_body_exited(body: Node2D) -> void:
	found = false


func _on_hit(area: Area2D) -> void:
	damage(area.get_parent().get_parent().power, 1 if area.get_parent().get_parent().position.x < position.x else -1)

func damage(amount, direct):
	health -= amount
	hit = true
	velocity = Vector2(KNOCKBACKX * direct, KNOCKBACKY)
	if health <= 0:
		frog.queue_free()

extends CharacterBody2D

@onready var bat: CharacterBody2D = $"."

const SPEED = 200.0
const KNOCKBACKX = 200
const KNOCKBACKY = -100
const power = 2

var found: bool
var destination: Vector2
var target
var direction = 1
var health = 2
var hit = false

func _physics_process(delta: float) -> void:
	if global.running:
		if found:
			destination=target.position
			if bat.position.x>destination.x:
				direction = -1
			else:
				direction = 1
	move_and_slide()

func _on_sight_body_entered(body: Node2D) -> void:
	found=true
	target=body

func _on_sight_body_exited(body: Node2D) -> void:
	found = false

func _on_hit(area: Area2D) -> void:
	damage(area.get_parent().get_parent().power, 1 if area.get_parent().get_parent().position.x < position.x else -1)

func damage(amount, direct):
	health -= amount
	velocity = Vector2(KNOCKBACKX * direct, KNOCKBACKY)
	if health <= 0:
		bat.queue_free()

extends CharacterBody2D
const jumpHeight = -580.0
const max_speed = 500
const acceleration = 1500
const friction = 1000
var is_slippery

@onready var audio_player = $AudioStreamPlayer2D

func _physics_process(delta: float) -> void:
	var was_on_floor = is_on_floor()
	if not is_on_floor():
		velocity = velocity + get_gravity() * delta

		
	var direction:= Input.get_axis("ui_left", "ui_right")
	if is_slippery:
		
			if direction:
				#velocity.y = -50000 # alskdjf;laksdjflk;j
				velocity.x = move_toward(velocity.x, direction * (max_speed), acceleration * delta * 1.15)
			else:
				velocity.x = move_toward(velocity.x, 0, (friction - 500) * delta)
	
	else:
			if direction:
				velocity.x = move_toward(velocity.x, direction * max_speed, acceleration * delta)
			else:
				velocity.x = move_toward(velocity.x, 0, friction * delta)
	
	
	
	
	if is_on_floor():
		var collision = get_last_slide_collision()
		if collision:
			var collider = collision.get_collider()
			if collider.has_method("handle_touch"):
				collider.handle_touch(self)
	
	move_and_slide()

	if is_on_floor():
		velocity.y = jumpHeight
		
		
	
	if is_on_floor() and not was_on_floor:
		audio_player.play()


@onready var player = get_node("../Player")
func _process(delta: float) -> void:
	var normalized_var = clamp(-player.position.y / 8000, 0.0, 1.0)
	modulate.a = 2 - normalized_var

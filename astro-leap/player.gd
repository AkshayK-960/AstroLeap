extends CharacterBody2D
const jumpHeight = -580.0
const max_speed = 500
const acceleration = 1500
const friction = 1000
var is_slippery

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity = velocity + get_gravity() * delta

		
	var direction:= Input.get_axis("ui_left", "ui_right")
	if is_slippery:
		
			if direction:
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


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.

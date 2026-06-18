extends Area2D
@onready var timer = $Timer

func _on_body_entered() -> void:
	print("KILLBRICK ACTIVATED")
	await get_tree().create_timer(2).timeout
	print("aler t")
func on_timer_timeout() -> void:
	get_tree().reload_current_scene()

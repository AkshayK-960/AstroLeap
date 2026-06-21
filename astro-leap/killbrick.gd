extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://title.tscn")
		print("level failed")
		clear_all()
		
		
func clear_all():
	for child in get_children():
		child.queue_free()

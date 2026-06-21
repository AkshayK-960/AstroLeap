extends StaticBody2D
@export_enum("Normal", "Icy", "Fragile") var platform_type: String = "Fragile"

func _ready() -> void:
	remove_from_group("Player")

func handle_touch(player):
	if platform_type == "Fragile":
		await get_tree().create_timer(0.1).timeout
		queue_free()
	elif platform_type == "Icy":
		player.is_slippery = true
	elif platform_type == "Normal":
		player.is_slippery = false

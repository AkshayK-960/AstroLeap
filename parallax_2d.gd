extends Parallax2D
@export var max_value: float = 100.0
@onready var player = get_node("../Player")

func _process(delta: float) -> void:
	var normalized_var = clamp(-player.position.y / 8000, 0.0, 1.0)
	modulate = Color(0.15 - normalized_var, 0.51 - normalized_var, 1.1 - normalized_var)


#use 8000

extends Camera2D


func _ready() -> void:
	make_current()
	editor_draw_drag_margin = false
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if %Player.global_position.y < global_position.y:
		global_position.y = %Player.global_position.y

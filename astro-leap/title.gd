extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if label_settings == null:
		label_settings = LabelSettings.new()
	
	
	label_settings.font_size = 60
	label_settings.font_color = Color(1.0, 1.0, 1.0, 1.0)

var maxScore: int = 0
func _process(delta: float) -> void:
	pass

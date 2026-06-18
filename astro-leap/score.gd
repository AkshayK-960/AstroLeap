extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if label_settings == null:
		label_settings = LabelSettings.new()
	
	
	label_settings.font_size = 300
	label_settings.font_color = Color(0.0, 0.0, 0.0, 1.0)

var maxScore: int = 0
func _process(_delta: float) -> void:
	
	
	
	var currScore = max(int(0), int(floor(-%Player.position.y / 100)))
	
	if currScore > maxScore:
		maxScore = currScore
		
	self.text = str(maxScore)
# text = str(int(floor(-%Player.position.y / 100)))

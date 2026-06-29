extends Node2D

var normal_platform_scene = preload("res://normal_platform.tscn")
var icy_platform_scene = preload("res://icy_platform.tscn")
var fragile_platform_scene = preload("res://fragile_platform.tscn")

@export var height_gap: float = 1000
var next_spawn_y = 300

var normal_platform_instance = normal_platform_scene.instantiate()


func _ready():
	remove_from_group("Player")
	
	for i in 10000:
		var normal_platform_instance = normal_platform_scene.instantiate()
		var icy_platform_instance = icy_platform_scene.instantiate()
		var fragile_platform_instance = fragile_platform_scene.instantiate()
		var spacing = 120
		
		normal_platform_instance.position = Vector2(randi_range(-200, 200), i * -spacing)
		icy_platform_instance.position = Vector2(randi_range(-200, 200), i * -spacing)
		fragile_platform_instance.position = Vector2(randi_range(-200, 200), i * -spacing)
		
		
		var current_scale_value = lerp(1.0, 0.8, clamp(i * 100, 0.0, 1.0))
		var randomplatformtype = randi_range(1, 3)
		
		if randomplatformtype == 1:
			add_child(normal_platform_instance)
		elif randomplatformtype == 2:
			add_child(icy_platform_instance)
		elif randomplatformtype == 3:
			add_child(fragile_platform_instance)

@onready var player = get_node("../Player")
func _process(delta: float) -> void:
	var normalized_var = clamp(-player.position.y / 8000, 0.0, 1.0)
	modulate.a = 1.5 - normalized_var

extends Area2D

@onready var fade_rect = $CanvasLayer/ColorRect  # your black ColorRect

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	# Start fully transparent
	fade_rect.modulate.a = 0.0

func _on_body_entered(_body):
	fade_to_black("res://Scenes/stage_1.tscn")

func fade_to_black(scene_path: String):
	# Create a Tween to fade to black
	var t = create_tween()
	t.tween_property(fade_rect, "modulate:a", 1.0, 2)  # fade in 0.5s
	t.finished.connect(Callable(self, "_on_fade_complete").bind(scene_path))

func _on_fade_complete(scene_path: String):
	get_tree().change_scene_to_file(scene_path)

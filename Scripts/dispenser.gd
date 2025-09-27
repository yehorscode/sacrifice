extends Node2D

@export var arrow_scene: PackedScene
@export var shoot_interval: float = 2.0
@export var arrow_direction: Vector2 = Vector2.RIGHT

func _ready() -> void:
	start_shooting()

func start_shooting() -> void:
	shoot_arrow()
	
func shoot_arrow() -> void:
	var arrow = arrow_scene.instantiate()
	get_parent().add_child(arrow)
	arrow.global_position = global_position
	arrow.direction = arrow_direction
	await get_tree().create_timer(shoot_interval).timeout
	shoot_arrow()

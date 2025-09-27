extends Area2D

@export var speed: float = 1000.0
var direction: Vector2 = Vector2.RIGHT

func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body: Node) -> void:
	body.die()
	queue_free()

func _process(delta: float) -> void:
	position += direction * speed * delta

extends Area2D

@export var speed: float = 500.0
var direction: Vector2 = Vector2.RIGHT

func _process(delta: float) -> void:
	position += direction * speed * delta

func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		if body.has_method("die"):
			body.die()   # Call player's death function
		queue_free()

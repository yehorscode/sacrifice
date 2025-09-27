extends Area2D

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	# Only call die() if the body has that method
	if body.has_method("die"):
		body.die()

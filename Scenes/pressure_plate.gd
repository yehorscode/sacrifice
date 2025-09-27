extends Area2D

signal box_entered
signal box_exited

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))
	print("[PLATE] Ready: signals connected")

func _on_body_entered(body):
	if body.is_in_group("box"):
		print("[PLATE] Box entered:", body.name)
		emit_signal("box_entered")

func _on_body_exited(body):
	if body.is_in_group("box"):
		print("[PLATE] Box exited:", body.name)
		emit_signal("box_exited")

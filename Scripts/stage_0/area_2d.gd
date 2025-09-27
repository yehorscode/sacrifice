extends Node2D

func _on_area_2d_body_entered(body):
	if body.global_position.x < global_position.x:
		print("z lewej")
	elif body.position.x > global_position.x:
		print("z prawej")
	elif body.position.y > global_position.y:
		print("z góry")

func _process(delta: float) -> void:
	

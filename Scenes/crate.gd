extends RigidBody2D

func _ready():
	add_to_group("box")  # so pressure plates recognize it

func _process(delta: float) -> void:
	# velocity damping so it stops when not pushed
	linear_velocity *= 0.95

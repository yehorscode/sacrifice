extends Node

@export var completed_crates = 0

signal crate_placed
signal crate_removed

func _ready():
	for plate in get_tree().get_nodes_in_group("plates"):
		plate.connect("box_entered", Callable(self, "_on_crate_placed"))
		plate.connect("box_exited", Callable(self, "_on_crate_removed"))
	print("[CONTROLLER] Connected to all plates")

func _on_crate_placed():
	completed_crates += 1
	print("[CONTROLLER] Crate placed → total:", completed_crates)
	emit_signal("crate_placed")

func _on_crate_removed():
	completed_crates -= 1
	print("[CONTROLLER] Crate removed → total:", completed_crates)
	emit_signal("crate_removed")

func _process(delta: float) -> void:
	if completed_crates == 5:
		print("all done")

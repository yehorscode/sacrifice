extends Node

@export var completed_crates = 0

signal crate_placed
signal crate_removed

var all_done_printed := false  # flag to prevent spam

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
	# Reset the flag if crates are removed
	if completed_crates < 5:
		all_done_printed = false
func _process(delta: float) -> void:
	if completed_crates == 5 and not all_done_printed:
		var gate = get_parent().get_node("Gate") # adjust if hierarchy is different
		if gate:
			gate.queue_free()  # remove the gate node
			print("[CONTROLLER] Gate removed!")
		else:
			print("[CONTROLLER] Gate not found!") # helps debug path
		all_done_printed = true

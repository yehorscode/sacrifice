extends AnimatedSprite2D

@export var fps: float = 5.0

var frame_timer := 0.0
var current_frame := 0
var total_frames := 3  # frames 0,1,2

func _process(delta):
	frame_timer += delta
	if frame_timer >= 1.0 / fps:
		frame_timer = 0
		current_frame += 1
		if current_frame >= total_frames:
			current_frame = 0  # loop back to first frame
		frame = current_frame

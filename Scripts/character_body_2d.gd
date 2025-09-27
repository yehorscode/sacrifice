extends CharacterBody2D

@export var grid_size: int = 9
@export var move_speed: float = 200

@onready var sprite = $Sprite2D

# Load images from filesystem
var sprite_up   = load("res://Images/Character/Up.png")
var sprite_down = load("res://Images/Character/Down.png")
var sprite_left = load("res://Images/Character/Left.png")
var sprite_right = load("res://Images/Character/Right.png")

var target_position: Vector2
var moving: bool = false

func _ready():
	target_position = position

func _physics_process(delta):
	if moving:
		# Move towards the target tile
		var step = move_speed * delta
		position = position.move_toward(target_position, step)
		if position == target_position:
			moving = false
	else:
		handle_input()

func handle_input():
	var dir = Vector2.ZERO

	if Input.is_action_pressed("W_Foward"):
		dir = Vector2.UP
		sprite.texture = sprite_up
	elif Input.is_action_pressed("S_Backwards"):
		dir = Vector2.DOWN
		sprite.texture = sprite_down
	elif Input.is_action_pressed("A_Left"):
		dir = Vector2.LEFT
		sprite.texture = sprite_left
	elif Input.is_action_pressed("D_Right"):
		dir = Vector2.RIGHT
		sprite.texture = sprite_right

	if dir != Vector2.ZERO:
		var motion = dir * grid_size
		var collision = move_and_collide(motion)

		if collision == null:
			# No collision, move normally
			target_position = position + motion
			moving = true
		else:
			# If we collided with a box, push it
			var collider = collision.get_collider()
			if collider.is_in_group("box"):
				collider.apply_impulse(Vector2.ZERO, dir * 200)  # Adjust force as needed
				target_position = position + motion
				moving = true

func die():
	get_tree().call_deferred("reload_current_scene")

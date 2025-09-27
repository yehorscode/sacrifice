extends CharacterBody2D

@export var grid_size: int = 6
@export var move_speed: float = 200

@onready var sprite = $Sprite2D

# Load images from filesystem
var sprite_up   = load("res://Images/Character/Up.png")
var sprite_down = load("res://Images/Character/Down.png")
var sprite_left = load("res://Images/Character/Left.png")
var sprite_right = load("res://Images/Character/Right.png")

var target_position: Vector2
var moving: bool = false
var last_dir: Vector2 = Vector2.ZERO 

func _ready():
	target_position = position

func _physics_process(delta):
	if moving:
		position = position.move_toward(target_position, move_speed * delta)
		if position == target_position:
			moving = false
	else:
		handle_input()

func handle_input():
	var dir = Vector2.ZERO

	if Input.is_action_pressed("D_Right"):
		dir = Vector2.RIGHT
		sprite.texture = sprite_right
	elif Input.is_action_pressed("A_Left"):
		dir = Vector2.LEFT
		sprite.texture = sprite_left
	elif Input.is_action_pressed("W_Foward"):
		dir = Vector2.UP
		sprite.texture = sprite_up
	elif Input.is_action_pressed("S_Backwards"):
		dir = Vector2.DOWN
		sprite.texture = sprite_down

	if dir != Vector2.ZERO:
		last_dir = dir
		target_position = position + dir * grid_size
		moving = true

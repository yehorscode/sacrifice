extends CharacterBody2D

@export var speed = 400

func get_input():
	var input_direction = Input.get_vector("A_Left", "D_Right", "W_Foward", "S_Backwards")
	velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()

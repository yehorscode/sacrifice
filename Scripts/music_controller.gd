extends Node2D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func bgm_play():
	audio_stream_player.stream = preload("res://Sounds/soundtrack_mono(1).wav")
	audio_stream_player.play()

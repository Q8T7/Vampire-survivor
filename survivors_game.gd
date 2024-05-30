extends Node2D

@onready var asp = $AudioStreamPlayer

var volume = 8

func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout():
	spawn_mob()


func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true

func _ready():
	AudioServer.set_bus_volume_db(0,volume)
	asp.play()


func _on_audio_stream_player_finished():
	asp.play()

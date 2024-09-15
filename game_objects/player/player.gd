extends Area2D

@export var laser_tscn: PackedScene 
@onready var main_scene = $".."

@export var explosion_sound: AudioStreamMP3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	move()
	shoot()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		play_explosion_sound()
		queue_free()
		main_scene.is_game_over = true

func move():
	var mouse_position: Vector2 = get_global_mouse_position()
	if mouse_position.x < 0:
		position.x = 0
	elif mouse_position.x > 540:
		position.x = 540
	else:
		position.x = mouse_position.x

func shoot():
	if Input.is_action_just_pressed("fire"):
		var new_laser = laser_tscn.instantiate()
		add_sibling(new_laser)
		new_laser.position = self.position
		
func play_explosion_sound():
	var audio_stream_player = AudioStreamPlayer.new()
	audio_stream_player.stream = explosion_sound
	add_sibling(audio_stream_player)
	audio_stream_player.play()

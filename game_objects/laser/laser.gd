extends Area2D

@export_group("My Properties") # just for godot ui, useful if you have a lot of export vars
@export var speed: float = 600
@export var shooting_sound: AudioStreamMP3 
@export var explosion_sound: AudioStreamWAV

@onready var main_scene = $".."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AudioStreamPlayer2D.stream = shooting_sound
	$AudioStreamPlayer2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y -= speed * delta


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		play_explosion_sound()
		area.queue_free()
		queue_free()
		main_scene.score += 10
		
func play_explosion_sound():
	var audio_stream_player = AudioStreamPlayer.new()
	audio_stream_player.stream = explosion_sound
	audio_stream_player.volume_db = -6.0
	add_sibling(audio_stream_player)
	audio_stream_player.play()

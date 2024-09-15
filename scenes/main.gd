extends Node2D


@export var player_tscn: PackedScene
@export var background_sound: AudioStreamMP3

@onready var label_score: Label = $Control/LabelScore
@onready var label_game_over: Label = $Control/LabelGameOver
@onready var enemy_spawner: Node2D = $EnemySpawner
@onready var audio_player: AudioStreamPlayer2D = $AudioStreamPlayer2D

var score: int = 0
var is_game_over: bool = false

func _ready() -> void:
	audio_player.stream = background_sound
	audio_player.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	label_score.text = "Score: {}".format([score], "{}")
	
	if is_game_over:
		label_game_over.visible = true
		restart_game()
		
func restart_game():
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()

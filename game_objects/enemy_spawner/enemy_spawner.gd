extends Node2D

@export var enemy_tscn: PackedScene
@export var min_spawn_timer: float = 0.20

@onready var timer: Timer = $Timer

func _on_timer_timeout() -> void:
	var new_enemy = enemy_tscn.instantiate()
	new_enemy.position.x = randf_range(0, get_viewport_rect().size.x)
	add_child(new_enemy)
	
	if timer.wait_time > min_spawn_timer:
		timer.wait_time -= 0.03
		print(timer.wait_time)

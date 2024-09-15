extends Area2D

@export var speed: float = 400
@onready var main_scene = $".."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += speed * delta

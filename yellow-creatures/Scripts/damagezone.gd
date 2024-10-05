extends Area2D

@export var damageDone : int

@onready var timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("you got hurt")
	body.take_damage(1)

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()

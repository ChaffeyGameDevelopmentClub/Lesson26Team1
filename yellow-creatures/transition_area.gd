extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("you died")
	Engine.time_scale = 0.5

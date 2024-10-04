extends Area2D


@onready var timer = $Timer
var health = 5
func _process(delta: float) -> void:
	
func _on_body_entered(body: Node2D) -> void:
	print_debug(body.name)
	if body.name == "Player":
		health -= 1
		if health <= 0:
			print_debug("you died")
			Engine.time_scale = 0.5
			timer.start()
		var playerpos = body.position
		if playerpos.x > self.position.x:
			body.position.x += lerp(body.position.x, body.position.x + 100, 0.5)
			body.position.y -= 100
		if playerpos.x < self.position.x:
			body.position.x -= 100
			body.position.y -= 100

		
func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()

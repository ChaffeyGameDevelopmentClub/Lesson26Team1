extends Area2D

var gettingflung = 100
@onready var timer = $Timer
var health = 5
func _process(delta: float) -> void:
	pass
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
			#for n in range(10,0,-1):
				#body.position.x += 10
				#body.position.y -= 10
		#if playerpos.y < self.position.y:
			#body.position.x -= lerp(body.position.x, body.position.x - 10, 0.5)
			#body.position.y -= lerp(body.position.y, body.position.y - 10, 0.5)

		
func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()

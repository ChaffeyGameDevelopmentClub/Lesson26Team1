extends Node2D
@export var timer : Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if seen:
		position.x += 100 * delta
		

var seen = false
func _on_area_2d_body_entered(body: Node2D) -> void:
	
		#print(body.name)
	if body.name == 'Player':
		seen = true
		#while seen:
			#print("can see")
			#position.x += 100
		#move_toward(self.position.y,body.global_position.y,.03)

func _on_area_2d_body_exited(body: Node2D) -> void:
	timer.start()


func _on_timer_timeout() -> void:
	seen = false

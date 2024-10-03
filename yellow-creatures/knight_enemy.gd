extends CharacterBody2D

var SPEED = 200
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false

func _physics_process(delta: float) -> void:
	#gravity for knight
	velocity.y += gravity * delta
	if chase == true:
		#below plays jump animation. save for when added
		#get_node("AnimatedSprite2D").play("Jump")
		player = $"../../player test"
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
				#flips appearance of knight depending on default direction
				get_node("AnimatedSprite2D").flip_h = false
		else:
			get_node("AnimatedSprite2D").flip_h = true
		velocity.x = direction.x * SPEED
	else:
		#get_node("AnimatedSprite2D").play("Idle")
		velocity.x = 0
	move_and_slide()

func _on_player_detect_body_entered(body: Node2D) -> void:
	if body.name == "player test":
		chase = true


func _on_player_detect_body_exited(body: Node2D) -> void:
	if body.name == "player test":
		chase = false


func _on_player_death_body_entered(body: Node2D) -> void:
	if body.name == "player test":
		self.queue_free() #removes enemy lol

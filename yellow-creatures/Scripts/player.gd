extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -800.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var jumps : int

var health : int

func _ready():
	$"Sprite2D/Player Animation".play("Idle")
	jumps = 2
	health = 3

func _input(event):
	if event.is_action_pressed("ui_left"):
		self.scale = Vector2(-1,1)
		self.rotation_degrees = 0
	if event.is_action_pressed("ui_right"):
		self.scale = Vector2(1,1)
		self.rotation_degrees = 0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		if jumps > 1:
			velocity.y = JUMP_VELOCITY
			jumps-=1
	if is_on_floor():
		jumps = 2
	if velocity.y < 0 and not is_on_floor():
		$"Sprite2D/Player Animation".play("JumpUp")
	elif velocity.y > -300 and velocity.y < 300 and not is_on_floor():
		$"Sprite2D/Player Animation".play("JumpPeak")
	elif velocity.y > 0 and not is_on_floor():
		$"Sprite2D/Player Animation".play("JumpFall")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		$"Sprite2D/Player Animation".play("Walk")
	elif is_on_floor():
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$"Sprite2D/Player Animation".play("Idle")

	move_and_slide()	

func take_damage(damage:int):
	health -= damage
	$DamageTimer.start()
	$HealthBar.visible = true
	print(health*100/3)
	$HealthBar.value = health*100/3
	if health < 1:
		Engine.time_scale = 1.0
		get_tree().reload_current_scene()


func _on_damage_timer_timeout():
	$HealthBar.visible = false

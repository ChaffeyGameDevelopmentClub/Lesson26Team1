extends Node2D

@export var speed: int

var direction = 1

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var anime = $AnimatedSprite2D 


func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1
		anime.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		anime.flip_h = false
	
	position.x += direction * speed * delta
	

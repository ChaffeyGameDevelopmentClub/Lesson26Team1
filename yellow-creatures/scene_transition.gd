extends Node2D
@export var Player : CharacterBody2D
@export var nextGraphic : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_K):
		get_tree().current_scene.get_node("SimpleTransition").change_scene("res://scenes/movement_testing.tscn")


func _on_transition_area_body_entered(body: CharacterBody2D) -> void:
	print("test1")
	if body.name == "Player":
		print("TEST")
		Engine.time_scale = 0.5


func _on_transition_area_area_entered(area):
	if area.name == "Player":
		print("TEST2")
		Engine.time_scale = 0.5

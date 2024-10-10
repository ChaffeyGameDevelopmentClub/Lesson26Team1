extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/movement_testing.tscn") # To gay baby jail

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Menus/Settings.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit() # Simple Quit Function

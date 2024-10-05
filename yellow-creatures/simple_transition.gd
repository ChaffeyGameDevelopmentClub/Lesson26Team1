extends CanvasLayer

@export var player : CharacterBody2D

func change_scene(target: String, type: String = 'dissolve') -> void:
	transition_dissolve(target)
	

func transition_dissolve(target: String) -> void:
	$dissolve_rect.position = player.get_node("Camera2D").position
	$dissolve_rect.visible = true
	$AnimationPlayer.play('dissolve_backwards')
	await $AnimationPlayer.animation_finished
	print(target)
	get_tree().change_scene_to_file.bind(target).call_deferred()
	$AnimationPlayer.play('dissolve')

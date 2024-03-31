extends Node3D

@onready var hud = $HUD
@onready var main_3d = $Main3D
var level_instance


func unload_level():
	if(is_instance_valid(level_instance)):
		level_instance.queue_free()
	level_instance = null


func load_level(level_path):
	unload_level()
	var level_resource = load(level_path)
	if (level_resource):
		level_instance = level_resource.instantiate()
		main_3d.add_child(level_instance)


func _on_start_pressed():
	load_level("res://levels/level0/room.tscn")
	hud.hide()


func _on_quit_pressed():
	get_tree().quit()

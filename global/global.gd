extends Node

var player: Player

func _input(event):
	if Input.is_action_just_pressed("fullscreen"):
		if get_window().mode == Window.MODE_EXCLUSIVE_FULLSCREEN:
			get_window().mode = Window.MODE_WINDOWED
		else:
			get_window().mode = Window.MODE_EXCLUSIVE_FULLSCREEN
	elif Input.is_action_just_pressed("kill_game"):
		get_tree().quit()

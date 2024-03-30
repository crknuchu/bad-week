extends Node3D

@onready var key = $Interactable

func _ready():
	key.interacted.connect(on_key_interacted)
	
func on_key_interacted():
	print("pick up key")
	#start fade to black and load next level

extends Node3D

@onready var door = $Interactable
@onready var door_inside = $door/vRAT

func _ready():
	door.interacted.connect(on_door_interacted)
	
func on_door_interacted():
	door_inside.open_door()
	door.queue_free()

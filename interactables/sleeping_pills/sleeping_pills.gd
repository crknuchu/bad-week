extends Node3D

@onready var pills = $Interactible

func _ready():
	pills.interacted.connect(on_pills_interacted)
	
func on_pills_interacted():
	Global.player.take_pills()
	self.queue_free()

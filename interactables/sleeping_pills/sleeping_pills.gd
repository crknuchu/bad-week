extends Node3D

@onready var pills = $Interactible

func _ready():
	pills.interacted.connect(on_pills_interacted)
	
func on_pills_interacted():
	print("take pills")
	#treba nam sistem da ne mozes da legnes da spavas dok ne popijes svoje tablete

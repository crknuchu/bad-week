extends Node3D

@onready var bed = $Interactable

func _ready():
	bed.interacted.connect(on_bed_interacted)
	
func on_bed_interacted():
	print("sleep")
	#start fade to black and load next level

extends Node3D


@export var openable: bool = false
var open = false

func _ready():
	if not openable:
		$vrata.collision_layer = 0


func _on_vrata_interacted():
	open = not open
	var tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_SINE)
	tween.tween_property($vrata,"rotation_degrees:y", 110 if open else 0, 0.4)

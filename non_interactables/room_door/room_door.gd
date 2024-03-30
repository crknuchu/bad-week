extends Interactable

@export var openable: bool = true
var open: bool = false


func _ready():
	if not openable:
		collision_layer = 1


func on_interact(player):
	open = not open
	var tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(get_parent(),"rotation_degrees:y", 110 if open else 0.0, 0.4)
	
